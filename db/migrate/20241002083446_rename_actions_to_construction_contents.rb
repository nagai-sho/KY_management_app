class RenameActionsToConstructionContents < ActiveRecord::Migration[7.0]
  def change
    rename_table :actions, :construction_contents
  end
end
