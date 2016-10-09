class Glassware < ActiveRecord::Base
  acts_as :material

  validates :ufsc_id, presence: true, uniqueness: true
  validates :quantity, presence: true

  validate :capacity_volume

  def capacity_volume
    if self.capacity
      begin
        Unit.new(self.capacity).convert_to('ml')
      rescue
        errors.add(:capacity, 'capacidade deve ser uma unidade de volume. Ex: 100ml, 100l')
      end
    end
  end
end
