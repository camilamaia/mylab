class Material < ActiveRecord::Base
  extend Enumerize

  enumerize :kind, in: [:permanente, :custeio]
  validates :name, presence: true
  validates :kind, presence: true
end
