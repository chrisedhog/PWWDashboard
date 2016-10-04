class AddColsToUser < ActiveRecord::Migration
  def change
    add_column :users, :change_pass, :boolean, default: false
  end
end
