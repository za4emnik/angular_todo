module Api::V1::CommentDoc
  extend Apipie::DSL::Concern

  def self.superclass
    Api::V1::CommentsController
  end

  resource_description do
    resource_id 'Comments'
    short 'Comments in your tasks'
    formats [:json]
  end

  api :GET, '/projects/:id/tasks/:id/comments', 'Get comments'
  def index
  end

  api :GET, '/projects/:id/tasks/:id/comments/:id', 'Get comment'
  def show
  end

  api :POST, '/projects/:id/tasks/:id/comments', 'Create comment'
  def create
  end

  api :PATCH, '/projects/:id/tasks/:id/comments/:id', 'Update comment'
  def update
  end

  api :DELETE, '/projects/:id/tasks/:id/comments/:id', 'Delete comment'
  def destroy
  end
end
