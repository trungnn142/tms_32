class Supervisor::CourseUsersController < ApplicationController
  before_action :load_course

  def show
    @users = User.all.paginate page: params[:page],
      per_page: 10
    @trainees = @users.trainees
    @supervisors = @users.supervisors
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
