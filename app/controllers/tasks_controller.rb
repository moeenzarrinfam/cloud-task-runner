class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    redirect_to task_path(@task), notice: 'Task Is uneditable.' unless @task.new_?
  end

  # POST /tasks
  def create
    @task = Task.new(task_params.merge(user: current_user).merge(uid: SecureRandom.uuid))
    return render :new unless @task.save

    redirect_to edit_task_path(@task), notice: 'Task was successfully created.'
  end

  # PATCH/PUT /tasks/1
  def update
    redirect_to task_path(@task), notice: 'Task Is uneditable.' unless @task.new_?
    if @task.update(task_params)
      ContainerMakers::Python3.call(task: @task)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:environment_id, :file, :name, :exec_command)
  end
end
