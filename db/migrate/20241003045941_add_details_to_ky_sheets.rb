class AddDetailsToKySheets < ActiveRecord::Migration[7.0]
  def change
    add_column :ky_sheets, :construction_date, :string, null: false
    add_reference :ky_sheets, :project, foreign_key: true
    add_reference :ky_sheets, :user,    foreign_key: true
  end
end
