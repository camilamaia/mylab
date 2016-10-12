class CreateItemStandardSolutions < ActiveRecord::Migration
  def change
    create_table :item_standard_solutions do |t|
      t.date :shelf_life
    end
  end
end
