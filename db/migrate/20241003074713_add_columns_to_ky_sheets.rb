class AddColumnsToKySheets < ActiveRecord::Migration[7.0]
  def change
    add_column :ky_sheets, :risk_level_id, :integer, null: false, default: 0
    add_column :ky_sheets, :incidence_rate_id, :integer, null: false, default: 0
    add_column :ky_sheets, :construction_type_id, :integer, null: false, default: 0
  end
end
