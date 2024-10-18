class RemoveNullConstraintFromConstructionDate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :ky_sheets, :construction_date, true
  end
end
