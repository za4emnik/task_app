class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
    @task = Task.new
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])

    respond_to do |format|
        format.html { redirect_to @project}
        format.js   {}
    end
  end

  def create
    @project = Project.new(project_params)
    @task = Task.new
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project}
        format.js   {}
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(project_params)
        format.js   {}
      else
        render 'edit'
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path}
      format.js {}
    end
  end

  private
  def project_params
    params.require(:project).permit(:name).merge(user: current_user)
  end

end
