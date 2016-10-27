class RenameProjectsToLocation < ActiveRecord::Migration
  def change
    change_table :searches do |t|
      t.rename :project, :location
    end
  end
end
