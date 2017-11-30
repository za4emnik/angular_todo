class Api::V1::CommentsController < Api::V1::ApplicationController
  include CommentDoc
  load_and_authorize_resource :project
  load_and_authorize_resource :task, through: :project
  load_and_authorize_resource :comment, through: :task

  def index
    render json: @comments
  end

  def show
    render_obj @comment
  end

  def create
    @comment.save
    render_obj @comment
  end

  def update
    @comment.update(comment_params)
    render_obj @comment
  end

  def destroy
    @comment.remove_attachment!
    @comment.delete
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :remote_attachment_url)
  end
end
