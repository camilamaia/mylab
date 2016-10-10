class Glassware < ActiveRecord::Base
  acts_as :material

  validates :ufsc_id, presence: true, uniqueness: true
  validates :quantity, presence: true

  validate :capacity_unit

  def capacity_unit
    if self.capacity && !self.capacity.blank?
      begin
        Unit.new(self.capacity).convert_to('ml')
      rescue
        errors.add(:capacity, 'capacidade deve ser uma unidade de volume. Ex: 100mL, 100L')
      end
    end
  end
end
