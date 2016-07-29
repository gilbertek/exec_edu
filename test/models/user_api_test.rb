require 'test_helper'

class UserApiTest < ActiveSupport::TestCase
  test "#authenticate user" do
    VCR.use_cassette('authenticate_api/post-success') do
      @user_token = UserApi.authenticate(params: {email: 'gilberts55@hotmail.com', password: 'test12345'})
    end

    assert_not @user_token.nil?
  end

  test "#authenticate user with invalid credentials" do
    VCR.use_cassette('authenticate_api/post-failed') do
      @user_token = UserApi.authenticate(params: {email: 'example@hotmail.com', password: 'password'})
    end

    byrbug
    assert_not @user_token.nil?
  end
end
