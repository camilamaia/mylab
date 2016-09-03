class RemoveUserIdFromStocks < ActiveRecord::Migration
  def change
    remove_column :stocks, :user_id, :integer
  end
end
