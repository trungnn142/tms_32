class Supervisor::SubjectsController < Supervisor::BaseController
  before_action :load_subject, except: [:index, :new, :create]

  def index
    @subjects = Subject.paginate page: params[:page], per_page: 12
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
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

  def update
    if @subject.update_attributes subject_params
      flash[:info] = t "application.flash.update_subject"
      redirect_to [:supervisor, @subject]
    else
      render :edit
    end
  end

  def show
    @tasks = @subject.tasks
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "application.flash.del_subject"
      redirect_to supervisor_subjects_url
    else
      flash[:error] = t "application.flash.subject_deleted_failed"
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :instruction,
      tasks_attributes: [:id, :name, :order, :_destroy]
  end

  def load_subject
    @subject = Subject.find params[:id]
  end
end
