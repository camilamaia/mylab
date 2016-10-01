class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :material, index: true
      t.belongs_to :stock, index: true
      t.actable
      t.timestamps
    end
  end
end
