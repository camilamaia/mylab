class Stock < ActiveRecord::Base
  belongs_to :responsible, :class_name => 'User', :foreign_key => 'user_id'
end
