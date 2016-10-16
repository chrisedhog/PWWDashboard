class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :country
      t.string :region
      t.string :company
      t.string  :location
      t.decimal :prior_year
      t.decimal :business_plan
      t.decimal :q1_forecast
      t.decimal :q2_forecast
      t.decimal :q3_forecast
      t.decimal :q4_forecast
      t.boolean :new_client
      t.timestamps null: false
    end
  end
end
