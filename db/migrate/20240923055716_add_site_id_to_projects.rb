class AddSiteIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :site_id, :integer
  end
end
