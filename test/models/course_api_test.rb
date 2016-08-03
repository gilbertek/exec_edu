require 'test_helper'

class CourseApiTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('authenticate_api/post-success') do
      @user_token = UserApi.authenticate(params: {email: 'gilberts55@hotmail.com', password: 'test12345'})
    end
  end

  test "#by_id" do
    VCR.use_cassette('course_by_id_api/get-success') do
      @course = CourseApi.by_id({ id: 68, token: @user_token })
    end
    assert_not @course.nil?
  end

  test "#by_user" do
    VCR.use_cassette('course_by_user_api/get-success') do
      @course = CourseApi.by_user({ token: @user_token })
    end
    assert_not @course.nil?
  end
end
