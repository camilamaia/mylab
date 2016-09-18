class CreateLaboratory < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.string :name
      t.text :description
      t.integer :user_id
    end
  end
end
