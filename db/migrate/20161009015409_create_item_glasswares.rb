class CreateItemGlasswares < ActiveRecord::Migration
  def change
    create_table :item_glasswares do |t|
      t.string :current_quantity
    end
  end
end
