class AddDetailsSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :name,        :string, null: false
    add_column :sites, :postal_code, :string
    add_column :sites, :address,     :string
  end
end

# add_column :テーブル名, :カラム名, :データ型
