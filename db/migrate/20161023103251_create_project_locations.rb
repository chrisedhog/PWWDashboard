class CreateProjectLocations < ActiveRecord::Migration
  def change
    create_table :project_locations do |t|
      t.string :location
      t.string :region

      t.timestamps null: false
    end
  end
end
