json.array!(@projects) do |project|
  json.extract! project, :id, :client, :project_status, :project_status, :project_name, :completion_date, :completion_month, :budget_revenue, :budget_margin, :budget_margin
  json.url project_url(project, format: :json)
end
