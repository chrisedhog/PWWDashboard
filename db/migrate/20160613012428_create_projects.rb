class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :client
      t.string   :project_status
      t.string   :project_name
      t.date     :completion_date
      t.date     :completion_month
      t.decimal  :budget_revenue
      t.decimal  :budget_margin
      t.timestamps null: false
    end
  end
end
