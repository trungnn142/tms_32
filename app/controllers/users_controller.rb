class UsersController < ApplicationController
  before_action :logged_in, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t "application.flash.user_updated"
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end

  def logged_in
    redirect_to root_url unless logged_in?
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end
end
