class Material < ActiveRecord::Base
  extend Enumerize

  enumerize :kind, in: [:durable, :not_durable]
  validates :name, presence: true
  validates :kind, presence: true
end
