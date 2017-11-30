class Api::V1::ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions
  include Concerns::Api::V1::ExceptionHandler
  before_action :authenticate_user!

  private

  def render_obj(obj)
    if obj.errors.any?
      render_json(obj.errors.full_messages, :accepted)
    else
      render_json(obj, :ok)
    end
  end

  def render_json(obj, status)
    render json: obj, status: status
  end
end
