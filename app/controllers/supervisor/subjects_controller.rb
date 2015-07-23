class Supervisor::SubjectsController < ApplicationController
  before_action :load_subject, except: [:index, :new, :create]

  def index
    @subjects = Subject.paginate page: params[:page], per_page: 12
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "application.flash.create_subject"
      redirect_to [:supervisor, @subject]
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private
  def subject_params
    params.require(:subject).permit :name, :instruction
  end

  def load_subject
    @subject = Subject.find params[:id]
  end
end
