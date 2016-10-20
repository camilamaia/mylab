class StandardSolution < ActiveRecord::Base
  acts_as :material

  validates :concentration, presence: true

  validate :concentration_unit

  def concentration_unit
    if self.concentration
      unless Unit.new(self.concentration).compatible?('mg/l')
        errors.add(:concentration, 'Deve ser uma unidade de concentração. Ex: 100mg/L')
      end
    end
  end
end
