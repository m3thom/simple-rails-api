class Users::RegistrationsController < Devise::RegistrationsController
  include Users::UsersAuthenticable

  # POST /resource
  def create
    build_resource(sign_up_params)
    begin
      ActiveRecord::Base.transaction do
        resource.save
        if resource.persisted?
          if resource.active_for_authentication?
            # data = create_bridgeapi_user!
            # parsed = JSON.parse(data.body)
            # if data.body["uuid"].blank? # TO REFACTORING: check response status instead of uuid.
            #   resource.errors.add(:base,  parsed["message"])
            #   raise
            # end
            sign_up(resource_name, resource)
            respond_with resource
          else
            expire_data_after_sign_in!
            respond_with resource
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      end
    rescue => e
      Rails.logger.info("Users::RegistrationsController#create #{e}")
      render json: resource.errors, status: :bad_request
    end
  end

  protected

  private

  def sign_up_params
    params
        .require(:user)
        .permit(:email,
                :password,
                :name)
  end

  def create_bridgeapi_user!
    Faraday.post("#{ENV['BRIDGE_BASE_URL']}/users") do |req|
      req.headers['Bridge-Version'] = ENV['BRIDGE_VERSION']
      req.headers['Content-Type'] = 'application/json'
      req.headers['Client-Id'] = ENV['BRIDGE_CLIENT_ID']
      req.headers['Client-Secret'] = ENV['BRIDGE_CLIENT_SECRET']
      req.body = {
          email: resource.email,
          password: 'password123'
      }.to_json
    end
  end
end
