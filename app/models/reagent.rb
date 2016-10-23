class Reagent < ActiveRecord::Base
  acts_as :material
  extend Enumerize

  enumerize :physical_state, in: [:liquid, :solid], default: :liquid, scope: true
  enumerize :form, in: [:powder, :bar, :tablet], default: :powder, scope: true

  validates :ufsc_id, presence: true, uniqueness: true
  validate :purity_unit

  # Solid Reagents
  validate :weight_presence
  validate :weight_unit

  # Liquid Reagents
  validate :volume_presence
  validate :volume_unit

  def purity_unit
    if self.purity && !self.purity.blank?
      begin
        Unit.new(self.purity).convert_to('%')
      rescue
        errors.add(:purity, 'deve ser uma unidade em porcentagem. Ex: 10%')
      end
    end
  end

  def weight_presence
    if self.physical_state.solid? && (self.weight.nil? || self.weight.blank?)
      errors.add(:weight, 'não pode ficar em branco')
    end
  end

  def weight_unit
    if self.weight && !self.weight.blank?
      begin
        Unit.new(self.weight).convert_to('g')
      rescue
        errors.add(:weight, 'deve ser uma unidade de peso. Ex: 10mg')
      end
    end
  end

  def volume_presence
    if self.physical_state.liquid? && (self.volume.nil? || self.volume.blank?)
      errors.add(:volume, 'não pode ficar em branco')
    end
  end

  def volume_unit
    if self.volume && !self.volume.blank?
      begin
        Unit.new(self.volume).convert_to('ml')
      rescue
        errors.add(:volume, 'deve ser uma unidade de volume. Ex: 10mL')
      end
    end
  end

end
