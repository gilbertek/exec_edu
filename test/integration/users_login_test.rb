require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "invalid login" do
    get login_path
    # post login_path, params: { session: { email: "user@example.com", password: "password" } }
    # assert_redirected_to login_path
    # assert_equal 'Invalid email/password combination.', flash[:danger]
  end

  test "valid login" do
    get login_path

    # post login_path, params: { session: { email: "gilberts55@hotmail.com", password: "test12345" } }
    # assert_redirected_to user_courses_index_path(current_user)
  end
end
