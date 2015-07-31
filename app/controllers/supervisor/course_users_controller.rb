class Supervisor::CourseUsersController < Supervisor::BaseController
  before_action :load_course

  def show
    @users = User.all.paginate page: params[:page],
      per_page: 10
    @trainees = @users.trainees
    @supervisors = @users.supervisors.excluded current_user
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
