class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :project
      t.string :client
      t.date :from_date
      t.date :to_date

      t.timestamps null: false
    end
  end
end
