class Supervisor::CoursesController < ApplicationController
  before_action :load_course, except: [:index, :new, :create]

  def index
    @courses = Course.latest.paginate page: params[:page], per_page: 10
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

  def show
  end

  def edit
  end

  def update
    if @course.update course_params
      flash[:success] = t "application.flash.course_updated"
      redirect_to [:supervisor, @course]
    else
      render :edit
    end
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

  def load_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date,
      :is_active
  end
end
