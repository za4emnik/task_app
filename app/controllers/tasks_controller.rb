class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.js {  }
      end
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.js {}
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.js {}
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :status)
    end
end
