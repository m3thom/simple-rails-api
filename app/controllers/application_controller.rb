class ApplicationController < ActionController::API
  include Pagy::Backend

  respond_to :json

  before_action :authenticate_user!

  # Make pagy_metadata method to be available in the view renderer.
  helper_method :pagy_metadata
end
