class Users::SessionsController < Devise::SessionsController
  include Users::UsersAuthenticable

  prepend_before_action :require_no_authentication, only: [:re_authenticate]

  def re_authenticate
    self.resource = warden.authenticate!(auth_options)
    respond_with(resource)
  end

  protected

  private

  def respond_to_on_destroy
    head :no_content
  end
end
