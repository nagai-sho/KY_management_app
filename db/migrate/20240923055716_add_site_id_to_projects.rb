class AddSiteIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :site, foreign_key: true
  end
end
