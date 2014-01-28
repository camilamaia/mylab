class Material < ActiveRecord::Base
  extend Enumerize

  validates :name, presence: true
  # validates :kind, presence: true
  enumerize :kind, in: [:permanente, :custeio]
end
