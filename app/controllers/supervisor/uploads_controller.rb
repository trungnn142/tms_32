class Supervisor::UploadsController < ApplicationController
  def create
    begin
      import params[:file]
      flash[:success] = t "application.flash.import_success"
    rescue
      flash[:danger] = t "application.flash.import_failed"
    end
    redirect_to supervisor_users_path
  end

  private
  def import file
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash.merge! role: User.roles[:trainee]
      user = User.find_by email: user_hash["email"]
      User.create! user_hash if user.nil?
    end
  end
end
