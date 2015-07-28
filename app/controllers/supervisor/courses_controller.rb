class Supervisor::CoursesController < ApplicationController
  before_action :load_course, except: [:index, :new, :create]

  def index
    @courses = Course.latest.paginate page: params[:page], per_page: 10
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "application.flash.course_created"
      redirect_to [:supervisor, @course]
    else
      render :new
    end
  end

  def edit
  end

  def update
    params[:type] == "update_users" ? update_users : update_course
  end

  def destroy
    if @course.destroy
      flash[:success] = t "application.flash.course_deleted"
    else
      flash[:danger] = t "application.flash.course_deleted_failed"
    end
    redirect_to supervisor_courses_path
  end

  private
  def update_course
    if @course.update course_params
      flash[:success] = t "application.flash.course_updated"
      redirect_to [:supervisor, @course]
    else
      render :edit
    end
  end

  def update_users
    if @course.update course_users_params
      flash[:success] = t "application.flash.users_updated",
        course: @course.name
    else
      flash[:danger] = t "application.flash.users_updated_failed",
        course: @course.name
    end
    redirect_to :back
  end

  def load_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date,
      :is_active, subject_ids: []
  end

  def course_users_params
    params.require(:course).permit course_users_attributes: [:id, :user_id, :_destroy]
  end
end
