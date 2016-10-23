class CreateReagents < ActiveRecord::Migration
  def change
    create_table :reagents do |t|
      t.string :physical_state
      t.integer :ufsc_id
      t.string :cas
      t.string :purity
      t.string :synonym
      t.string :brand
      t.string :volume
      t.string :weight
      t.string :form
    end
  end
end
