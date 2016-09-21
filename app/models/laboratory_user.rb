class LaboratoryUser < ActiveRecord::Base
  belongs_to :laboratory
  belongs_to :user
end
