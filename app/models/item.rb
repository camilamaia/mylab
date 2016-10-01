class Item < ActiveRecord::Base
  actable

  belongs_to :stock
  belongs_to :material
end
