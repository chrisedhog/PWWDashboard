class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :country
      t.string :region
      t.string :company

      t.timestamps null: false
    end
  end
end
