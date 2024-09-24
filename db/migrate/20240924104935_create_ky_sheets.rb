class CreateKySheets < ActiveRecord::Migration[7.0]
  def change
    create_table :ky_sheets do |t|

      t.references :project,           null: false, foreign_key: true
      t.string     :construction_date, null: false
      t.timestamps
    end
  end
end
