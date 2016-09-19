class AddLaboratoryToUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.belongs_to :laboratory, index: true
    end
  end
end
