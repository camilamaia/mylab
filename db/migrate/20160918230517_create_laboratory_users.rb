class CreateLaboratoryUsers < ActiveRecord::Migration
  def change
    create_table :laboratory_users do |t|
      t.integer :laboratory_id
      t.integer :user_id
    end
  end
end
