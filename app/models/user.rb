class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stocks
  has_many :owned_laboratories, :class_name => 'Laboratory'

  has_many :laboratory_users
  has_many :laboratories, through: :laboratory_users

  validates :name, presence: true

end
