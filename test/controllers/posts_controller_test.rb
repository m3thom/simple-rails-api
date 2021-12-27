require "test_helper"
require 'devise/jwt/test_helpers'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get unauthorized response without headers" do
    get '/posts'
    assert_response :unauthorized
  end

  test "should get success response and collection of posts" do
    user = users(:one)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # This will add a valid token for `user` in the `Authorization` header
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)

    get '/posts', headers: auth_headers

    assert_response :success
    assert @response.body.present?
  end
end
