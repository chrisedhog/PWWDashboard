class AddProjectsToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :project, index: true, foreign_key: true
  end
end
