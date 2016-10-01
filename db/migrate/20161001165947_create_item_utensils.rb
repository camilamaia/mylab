class CreateItemUtensils < ActiveRecord::Migration
  def change
    create_table :item_utensils do |t|
      t.integer :current_quantity
    end
  end
end
