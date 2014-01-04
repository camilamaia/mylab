class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :quantity, presence: true                   
end
