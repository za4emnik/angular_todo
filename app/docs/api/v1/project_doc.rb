module Api::V1::ProjectDoc
  extend Apipie::DSL::Concern

  def self.superclass
    Api::V1::ProjectsController
  end

  resource_description do
    resource_id 'Projects'
    short 'Projects in your list'
    formats [:json]
  end

  api :GET, '/projects', 'Get projects'
  def index
  end

  api :GET, '/projects/:id', 'Get project'
  def show
  end

  api :POST, '/projects', 'Create project'
  def create
  end

  api :PATCH, '/projects/:id', 'Update project'
  def update
  end

  api :DELETE, '/projects/:id', 'Delete project'
  def destroy
  end
end
