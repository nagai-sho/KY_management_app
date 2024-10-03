class RemoveColumnsFromKySheets < ActiveRecord::Migration[7.0]
  def change
    remove_column :ky_sheets, :project_id, :integer
    remove_column :ky_sheets, :construction_date, :string
  end
end
