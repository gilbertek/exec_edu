require 'test_helper'

class UserApiTest < ActiveSupport::TestCase

  def setup
    @user_token = ''
  end

  test "#authenticate user" do
    VCR.use_cassette('authenticate_api/post-success') do
      @user_token = UserApi.authenticate(params: {email: 'gilberts55@hotmail.com', password: 'test12345'})
    end
    assert_not @user_token.nil?
  end

  test "#authenticate user with invalid credentials" do
    VCR.use_cassette('authenticate_api/post-failed') do
      assert_raises ExecOnlineApiError::ApiAuthenticationError do
        @user_token = UserApi.authenticate(params: {email: 'example@hotmail.com', password: 'password'})
      end
    end
  end

  test "#identify user" do
    VCR.use_cassette('identity_api/get-success') do
      @user = UserApi.identify(params: { token: @user_token })
    end
    assert_not @user["first_name"].nil?
    assert_not @user["last_name"].nil?
  end
end
