module Api::V1::TaskDoc
  extend Apipie::DSL::Concern

  def self.superclass
    Api::V1::TasksController
  end

  resource_description do
    resource_id 'Tasks'
    short 'Tasks in your project'
    formats [:json]
  end

  api :GET, '/projects/:id/tasks', 'Get tasks'
  def index
  end

  api :GET, '/projects/:id/tasks/:id', 'Get task'
  def show
  end

  api :POST, '/projects/:id/tasks', 'Create tasks'
  def create
  end

  api :PATCH, '/projects/:id/tasks/:id', 'Update tasks'
  def update
  end

  api :DELETE, '/projects/:id/tasks/:id', 'Delete tasks'
  def destroy
  end
end
