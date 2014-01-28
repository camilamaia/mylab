class RemoveDurableFromMaterials < ActiveRecord::Migration
  def change
    remove_column :materials, :durable, :boolean
  end
end
