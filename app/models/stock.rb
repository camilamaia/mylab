class Stock < ActiveRecord::Base
  belongs_to :responsible, :class_name => 'User', :foreign_key => 'user_id'

  validates :name, presence: true
  validates :responsible, presence: true
end
