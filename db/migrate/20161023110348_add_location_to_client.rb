class AddLocationToClient < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.string :location
    end
  end
end
