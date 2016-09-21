class Laboratory < ActiveRecord::Base
  has_many :stocks, dependent: :destroy

  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'

  has_many :laboratory_users, dependent: :destroy
  has_many :users, through: :laboratory_users

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  def owner=(user_owner)
    super
    self.users << user_owner unless self.users.include? user_owner
  end
end
