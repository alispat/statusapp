class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :component, foreign_key: true
      t.references :situation, foreign_key: true
      t.string :name
      t.text :message
      t.datetime :occourred_at
      t.boolean :maintenance, default: false
      t.boolean :notify, default: false

      t.timestamps
    end
  end
end
