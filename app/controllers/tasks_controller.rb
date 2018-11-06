class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    # POST /restaurants
    # Create a restaurant in the DB

    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
