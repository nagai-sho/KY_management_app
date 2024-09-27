class AddUniqueIndexToSiteName < ActiveRecord::Migration[7.0]
  def change
    add_index :sites, :name, unique: true
  end
end
