class Supervisor::CoursesController < ApplicationController
  before_action :load_course, only: [:show, :edit, :update, :destroy]

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

  private

  def load_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :end_date,
      :is_active)
  end
end
