class AddKindFromMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :kind, :string
  end
end
