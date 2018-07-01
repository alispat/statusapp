class AddMaintenanceToSituations < ActiveRecord::Migration[5.2]
  def change
    add_column :situations, :maintenance, :boolean, default: false
  end
end
