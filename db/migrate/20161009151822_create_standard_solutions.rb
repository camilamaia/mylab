class CreateStandardSolutions < ActiveRecord::Migration
  def change
    create_table :standard_solutions do |t|
      t.string :concentration
    end
  end
end
