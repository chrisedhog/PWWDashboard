class AddProjectsToClient < ActiveRecord::Migration
  def change
    # add_reference :clients, :project, index: true, foreign_key: true, on_delete: :cascade
  end
end
