require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  "",
                                         last_name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                          } }
    end
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name:  "John",
                                         last_name:  "Doe",
                                         email: "user@example.com",
                                         password:              "password" } }
    end
  end
end
