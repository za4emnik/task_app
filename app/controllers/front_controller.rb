class FrontController < ApplicationController

  before_filter :authenticate_user!

  def index
    @projects = Project.all
    @project = Project.new
    @task = Task.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def all_projects
      @projects = Project.all
    end

end
