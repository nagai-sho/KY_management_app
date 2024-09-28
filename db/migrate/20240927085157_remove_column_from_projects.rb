class RemoveColumnFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :site_id, :integer
  end
end
