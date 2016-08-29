class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  private
    def task_params
      params.require(:task).permit(:name, :status)
    end
end
