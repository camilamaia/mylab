class Laboratory < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'

  has_many :laboratory_users
  has_many :users, through: :laboratory_users
  has_many :stocks

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  def owner=(user_owner)
    super
    self.users << user_owner unless self.users.include? user_owner
  end
end
