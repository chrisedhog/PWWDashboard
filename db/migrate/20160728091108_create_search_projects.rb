class CreateSearchProjects < ActiveRecord::Migration
  def change
    create_table :search_projects do |t|
      t.string :client_name
      t.string :project_name

      t.timestamps null: false
    end
  end
end
