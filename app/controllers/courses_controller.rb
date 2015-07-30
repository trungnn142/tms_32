class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses.active.latest.paginate page: params[:page],
      per_page: 10
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.user_subjects
    @supervisors = @course.users.supervisors
    @subjects = @course.subjects
    @members = @course.users.trainees
    @activities = @course.activities.latest.paginate page: params[:page],
      per_page: 5
    respond_to do |format|
      format.html
      format.js {render "shared/activities"}
    end
  end
end
