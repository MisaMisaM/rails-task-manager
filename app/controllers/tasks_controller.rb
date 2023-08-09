class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    if @task.save
      redirect_to tasks_path
    else
      # give the form back again -> new.html.erb
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    # This is for the form
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path
    else
      # give the form back again -> edit.html.erb
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

    # strong params -> white-listing the attributes a user can give me (for security reasons)
    def task_params
      params.require(:task).permit(:title, :details, :completed)
    end
end
