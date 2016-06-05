class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.string :category
      t.string :access_level
      t.text :body
      t.string :anchor_id

      t.timestamps null: false
    end
  end
end
