class ChangeUfscIdToTextOnReagents < ActiveRecord::Migration
  change_column :reagents, :ufsc_id, :string, :limit => 50
end
