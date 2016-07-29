require 'test_helper'

class UserApiTest < ActiveSupport::TestCase
  test "#authenticate user" do
    VCR.use_cassette('authenticate_api/post-success') do
      @user = UserApi.authenticate(params: {email: 'gilberts55@hotmail.com', password: 'test12345'})
    end
  end
end
