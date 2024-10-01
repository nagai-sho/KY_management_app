class UpdateLocationsWithSitesForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :ky_sheet_id

    add_reference :locations, :site, foreign_key: true
  end
end
