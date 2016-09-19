class Stock < ActiveRecord::Base
  belongs_to :responsible, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :laboratory

  validates :name, presence: true, uniqueness: true
  validates :responsible, presence: true
  validates :laboratory, presence: true
  validate :user_belongs_to_lab

  def user_belongs_to_lab
    unless self.responsible.laboratories.include? self.laboratory
      errors.add(:responsible, 'user must belong to the same laboratory')
    end
  end
end
