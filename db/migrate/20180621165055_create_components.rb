class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.string :name
      t.string :url
      t.string :description
      t.references :group, foreign_key: true
      t.references :situation, foreign_key: true

      t.timestamps
    end
  end
end
