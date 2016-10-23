class RemoveLocationFromClients < ActiveRecord::Migration
  def change
    change_table :clients do |t|
    t.remove :location
    end
  end
end
