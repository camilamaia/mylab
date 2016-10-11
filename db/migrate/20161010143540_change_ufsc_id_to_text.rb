class ChangeUfscIdToText < ActiveRecord::Migration
  change_column :glasswares, :ufsc_id, :string, :limit => 50
  change_column :utensils, :ufsc_id, :string, :limit => 50
end
