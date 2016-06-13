class RenameClientsToProjects < ActiveRecord::Migration
  def change
    rename_table :clients, :projects
  end
end
