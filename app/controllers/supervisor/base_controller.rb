class Supervisor::BaseController < ApplicationController
  before_action :authenticate_user!, :authorize_supervisor

  private
  def authorize_supervisor
    unless current_user.supervisor?
      flash[:danger] = t "application.flash.permission_denied"
      redirect_to root_url
    end
  end
end
