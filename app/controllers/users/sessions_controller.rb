class Users::SessionsController < Devise::SessionsController
  include Users::UsersAuthenticable

  skip_before_action :verify_signed_out_user

  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def re_authenticate
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    respond_with(resource)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  private

  def respond_to_on_destroy
    head :no_content
  end
end
