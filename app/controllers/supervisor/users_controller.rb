class Supervisor::UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize_supervisor

  def index
    @users = User.trainees.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t "application.flash.edit_trainee_success"
      redirect_to supervisor_users_path
    else
      flash[:danger] = t "application.flash.edit_trainee_failed"
      render :edit
    end

  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "application.flash.trainee_created"
      redirect_to supervisor_users_path
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "application.flash.destroy_trainee_success"
    else
      flash[:danger] = t "application.flash.destroy_trainee_failed"
    end
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :role
  end

  def load_user
    @user = User.find params[:id]
  end

  def authorize_supervisor
    unless current_user.supervisor?
      flash[:danger] = t "application.flash.permission_denied"
      redirect_to root_url
    end
  end
end
