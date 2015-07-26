class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses.active.latest.paginate page: params[:page],
      per_page: 10
  end
end
