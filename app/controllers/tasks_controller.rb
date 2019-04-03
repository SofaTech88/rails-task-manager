class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save!
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id]) #ok
  end

  def update
    @task = Task.find(params[:id]) #ok
    @task.update(task_params)
    redirect_to tasks_path
  end


  def destroy
    @task = Task.find(params[:id]) #ok
    @task.destroy #ok

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to task_path



  private
  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details, :completed)
  end

  # end
end
