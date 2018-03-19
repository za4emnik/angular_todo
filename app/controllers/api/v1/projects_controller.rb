class Api::V1::ProjectsController < Api::V1::ApplicationController
  include ProjectDoc
  load_and_authorize_resource

  def index
    render json: @projects
  end

  def show
    render_obj @project
  end

  def create
    project = current_user.projects.create!(project_params)
    render_obj project
  end

  def update
    @project.update(project_params)
    render_obj @project
  end

  def destroy
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
