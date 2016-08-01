require 'ostruct'

class CoursesController < ApplicationController
  before_action :authorize

  def index
    @courses = CourseApi.by_user({ token: current_user.auth_token })

    unless !@courses.nil? && @courses.any?
      flash[:danger] = 'You are not enrolled in any course at the moment.'
      redirect_to root_path
    end

    course = CourseApi.by_id({ id: @courses.first.fetch('id'), token: current_user.auth_token })
    @current_course = OpenStruct.new(course)
  end
end
