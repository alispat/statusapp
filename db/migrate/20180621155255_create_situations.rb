class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.string :name
      t.string :icon
      t.string :color

      t.timestamps
    end
  end
end
