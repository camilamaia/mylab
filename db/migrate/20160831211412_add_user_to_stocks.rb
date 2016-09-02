class AddUserToStocks < ActiveRecord::Migration
  def up
    change_table :stocks do |t|
      t.belongs_to :user, index: true
    end
  end
end
