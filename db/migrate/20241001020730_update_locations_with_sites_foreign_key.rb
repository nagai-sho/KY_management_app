class UpdateLocationsWithSitesForeignKey < ActiveRecord::Migration[7.0]
  def change

    add_reference :locations, :site, foreign_key: true
  end
end
