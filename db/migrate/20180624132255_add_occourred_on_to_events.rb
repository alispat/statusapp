class AddOccourredOnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :occourred_on, :date, index: true
  end
end
