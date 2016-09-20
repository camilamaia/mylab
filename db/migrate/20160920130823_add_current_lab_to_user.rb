class AddCurrentLabToUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.integer :current_lab_id
    end
  end
end
