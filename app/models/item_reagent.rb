class ItemReagent < ActiveRecord::Base
  acts_as :item
  extend Enumerize

  enumerize :conservation, in: [:bad, :medium, :good], default: :good, scope: true

  # Solid Reagents
  validate :current_weight_presence
  validate :current_weight_unit

  # Liquid Reagents
  validate :current_volume_presence
  validate :current_volume_unit

  def current_weight_presence
    if reagent.physical_state.solid? && (self.current_weight.nil? || self.current_weight.blank?)
      errors.add(:current_weight, 'não pode ficar em branco')
    end
  end

  def current_weight_unit
    if self.current_weight && !self.current_weight.blank?
      begin
        Unit.new(self.current_weight).convert_to('g')
      rescue
        errors.add(:current_weight, 'deve ser uma unidade de peso. Ex: 10mg')
      end
    end
  end

  def current_volume_presence
    if reagent.physical_state.liquid? && (self.current_volume.nil? || self.current_volume.blank?)
      errors.add(:current_volume, 'não pode ficar em branco')
    end
  end

  def current_volume_unit
    if self.current_volume && !self.current_volume.blank?
      begin
        Unit.new(self.current_volume).convert_to('ml')
      rescue
        errors.add(:current_volume, 'deve ser uma unidade de volume. Ex: 10mL')
      end
    end
  end

  def reagent
    self.item.material.actable_type.constantize.find self.item.material.actable_id
  end
end
