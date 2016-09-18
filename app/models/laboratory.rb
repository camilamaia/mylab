class Laboratory < ActiveRecord::Base
  belongs_to :responsible, :class_name => 'User', :foreign_key => 'user_id'
  has_many :users
  has_many :stocks

  validates :name, presence: true, uniqueness: true
  validates :responsible, presence: true

  def responsible=(user_responsible)
    self.users << user_responsible unless self.users.include? user_responsible
  end
end
