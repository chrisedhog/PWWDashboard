class ChangeDataTypeForProjects < ActiveRecord::Migration
  def change
    change_column :projects, :budget_revenue, :decimal
  end
end
