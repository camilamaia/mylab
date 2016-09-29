class Material < ActiveRecord::Base
  actable

  validates :name, presence: true
  validates :description, presence: true, uniqueness: true
end
