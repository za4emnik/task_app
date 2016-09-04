class FrontController < ApplicationController

  before_filter :authenticate_user!
  respond_to :json


  def index
    @projects = Project.where("user_id = ?", current_user)
    @project = Project.new
    @task = Task.new
  end

  def all_projects
      @projects = Project.all
    end

end
