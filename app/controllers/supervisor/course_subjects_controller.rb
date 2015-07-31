class Supervisor::CourseSubjectsController < Supervisor::BaseController
  before_action :load_course, only: [:show]

  def show
    @subjects = Subject.all
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
