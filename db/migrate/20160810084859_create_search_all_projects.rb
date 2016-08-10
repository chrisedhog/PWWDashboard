class CreateSearchAllProjects < ActiveRecord::Migration
  def change
    create_table :search_all_projects do |t|
      t.references :project, index: true, foreign_key: true
      t.references :search, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
