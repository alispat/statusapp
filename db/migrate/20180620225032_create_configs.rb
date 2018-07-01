class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.string :site
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
