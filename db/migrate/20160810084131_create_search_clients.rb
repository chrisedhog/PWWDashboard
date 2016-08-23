class CreateSearchClients < ActiveRecord::Migration
  def change
    create_table :search_clients do |t|
      t.references :client, index: true, foreign_key: true, on_delete: :cascade
      t.references :search, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
