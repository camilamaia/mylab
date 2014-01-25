class AddDurableToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :durable, :boolean
  end
end
