class AddDetailsToProjects < ActiveRecord::Migration[7.0]
  def change
    # add_column :projects, :name,                    :string, null: false
    # add_column :projects, :client,                  :string
    # add_column :projects, :construction_start,      :date
    # add_column :projects, :construction_completion, :date
    # add_column :projects, :construction_content,    :text

    # add_reference :projects, :sites, null: false, foreign_key: true
  end
end
