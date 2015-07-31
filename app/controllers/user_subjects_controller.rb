class UserSubjectsController < ApplicationController
  before_action :load_user_subject, only: [:show, :update]
  before_action :authenticate_user!

  def show
    @subject = @user_subject.subject
    @tasks = @subject.tasks
    @user_id = @user_subject.user_id
    @tasks.each do |task|
      @user_subject.user_tasks.find_or_initialize_by task_id: task.id,
        user_id: @user_id
    end
  end

  def update
    if @user_subject.update user_subject_params
      flash[:success] = t "application.flash.user_subject_updated"
    else
      flash[:danger] = t "application.flash.user_subject_update_failed"
    end
    redirect_to subject_user_subject_path @subject
  end

  private
  def load_user_subject
    @subject = Subject.find params[:subject_id]
    @user_subject = @subject.user_subjects.find_by(user_id: current_user.id)
  end

  def user_subject_params
    params.require(:user_subject).permit user_tasks_attributes: [:id, :user_id,
      :task_id]
  end
end
