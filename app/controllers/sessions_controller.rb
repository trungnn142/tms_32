class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember] == "1" ? remember(user) : forget(user)
      flash[:success] = t "application.flash.login_success"
      redirect_to root_url
    else
      flash[:danger] = t "application.flash.login_failed"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
