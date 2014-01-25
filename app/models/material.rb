class Material < ActiveRecord::Base
  validates :name, presence: true
  # validates :durable, presence: true
end
