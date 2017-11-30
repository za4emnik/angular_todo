class Api::V1::TasksController < Api::V1::ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :task, through: :project

  def index
    render json: @tasks
  end

  def show
    render_obj @task
  end

  def create
    @task.save
    render_obj @task
  end

  def update
    @task.update(task_params)
    render_obj @task
  end

  def destroy
    @task.delete
  end

  private

  def task_params
    params.require(:task).permit(:name, :deadline, :position, :aasm_state)
  end
end
