class CreateUtensils < ActiveRecord::Migration
  def change
    create_table :utensils do |t|
      t.integer :ufsc_id
      t.integer :quantity
    end
  end
end
