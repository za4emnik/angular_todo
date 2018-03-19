module Concerns
  module Api
    module V1
      module ExceptionHandler
        extend ActiveSupport::Concern

        included do
          rescue_from ActiveRecord::RecordNotFound do |e|
            render json: { message: e.message }, status: :not_found
          end

          rescue_from ActiveRecord::RecordInvalid do |e|
            render json: { message: e.message }, status: :unprocessable_entity
          end

          rescue_from CanCan::AccessDenied do |exception|
            render json: { message: exception.message }, status: :unauthorized
          end
        end
      end
    end
  end
end
