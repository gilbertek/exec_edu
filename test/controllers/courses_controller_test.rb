require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    VCR.use_cassette('authenticate_user/post-success') do
      sign_in_via_api(email: Rails.application.secrets.execonline_api_partner_email, password: Rails.application.secrets.execonline_api_partner_password)
      @user = current_user
    end
  end

  test "should get index" do
    get user_courses_index_path(@user)
    assert_response :success
  end
end
