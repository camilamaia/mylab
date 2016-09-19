class AddLaboratoryToStocks < ActiveRecord::Migration
  def up
    change_table :stocks do |t|
      t.belongs_to :laboratory, index: true
    end
  end
end
