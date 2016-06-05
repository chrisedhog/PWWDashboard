class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client
      t.string :project_status
      t.string :project_status
      t.string :project_name
      t.date :completion_date
      t.date :completion_month
      t.float :budget_revenue
      t.float :budget_margin
      t.decimal :budget_margin

      t.timestamps null: false
    end
  end
end
