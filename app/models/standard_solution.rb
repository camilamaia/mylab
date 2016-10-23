class StandardSolution < ActiveRecord::Base
  acts_as :material

  validates :concentration, presence: true

  validate :concentration_unit

  def concentration_unit
    if self.concentration
      begin
        Unit.new(self.concentration).convert_to('mg/l')
      rescue
        errors.add(:concentration, 'deve ser uma unidade de concentração. Ex: 100mg/L')
      end
    end
  end
end
