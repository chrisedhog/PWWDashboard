class CreateProjectClients < ActiveRecord::Migration
  def change
    create_table :project_clients do |t|
      t.references :client, index: true, foreign_key: true, on_delete: :cascade
      t.references :project, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
