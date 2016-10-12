class ItemUtensil < ActiveRecord::Base
  acts_as :item

  validates :current_quantity, presence: true
  validates :description, presence: true
end
