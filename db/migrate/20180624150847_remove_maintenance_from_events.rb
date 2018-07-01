class RemoveMaintenanceFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :maintenance
  end
end
