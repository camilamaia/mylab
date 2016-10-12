class AddIndexToCurrentLabToUser < ActiveRecord::Migration
  def change
    remove_column :users, :laboratory_id
    add_index :users, :current_lab_id
  end
end
