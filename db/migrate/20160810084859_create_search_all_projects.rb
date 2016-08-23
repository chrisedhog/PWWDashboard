class CreateSearchAllProjects < ActiveRecord::Migration
  def change
    create_table :search_all_projects do |t|
      t.references :project, index: true, foreign_key: true, on_delete: :cascade
      t.references :search, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
