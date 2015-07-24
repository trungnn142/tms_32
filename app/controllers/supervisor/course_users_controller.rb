class Supervisor::CourseUsersController < ApplicationController
  before_action :load_course

  def new
    @users = User.not_member_of(@course).paginate page: params[:page],
      per_page: 10
  end

  def show
    @users = @course.users.paginate page: params[:page],
      per_page: 10
  end

  def create
    user = User.find params[:user_id]

    if @course.add_user user
      flash[:success] = t "application.flash.user_added",
        user: user.name, course: @course.name
    else
      flash[:danger] = t "application.flash.user_add_failed",
        user: user.name, course: @course.name
    end

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render :create, locals: {user: user}}
    end
  end

  def destroy
    user = User.find params[:user_id]

    if @course.remove_user user
      flash[:success] = t "application.flash.user_removed",
        user: user.name, course: @course.name
    else
      flash[:success] = t "application.flash.user_remove_failed",
        user: user.name, course: @course.name
    end

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render :destroy, locals: {user: user}}
    end
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
