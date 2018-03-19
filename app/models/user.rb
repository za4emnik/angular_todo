class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :projects, -> { order(create_at: :asc) }, dependent: :destroy
end
