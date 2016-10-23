class CreateItemReagents < ActiveRecord::Migration
  def change
    create_table :item_reagents do |t|
      t.date :shelf_life
      t.string :conservation
      t.string :current_volume
      t.string :current_weight
    end
  end
end
