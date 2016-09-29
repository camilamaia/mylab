class Utensil < ActiveRecord::Base
  acts_as :material

  validates :ufsc_id, presence: true
  validates :quantity, presence: true
end
