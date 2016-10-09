class ItemGlassware < ActiveRecord::Base
  acts_as :item

  validates :current_quantity, presence: true
end
