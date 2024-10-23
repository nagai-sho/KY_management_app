class AddRevisionsToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :content, :string, null: false
  end
end
