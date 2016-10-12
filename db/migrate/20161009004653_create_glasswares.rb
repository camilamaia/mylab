class CreateGlasswares < ActiveRecord::Migration
  def change
    create_table :glasswares do |t|
      t.integer :ufsc_id
      t.string :capacity
      t.integer :quantity
    end
  end
end
