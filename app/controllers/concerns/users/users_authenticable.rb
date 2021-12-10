module Users::UsersAuthenticable
  extend ActiveSupport::Concern

  private

  def respond_with(resource, **_opts)
    render json: {
        user: {
            id: resource.id,
            email: resource.email,
            name: resource.name,
        },
        token: current_token
    }
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
