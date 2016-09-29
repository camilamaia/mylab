class UpdateMaterials < ActiveRecord::Migration
  def change
    remove_column :materials, :kind, :string
    remove_column :materials, :formula, :string

    change_table :materials do |t|
      t.text :description, null: false
      t.actable
    end
  end
end
