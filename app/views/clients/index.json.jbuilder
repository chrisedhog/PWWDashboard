json.array!(@clients) do |client|
  json.extract! client, :id, :client, :project_status, :project_status, :project_name, :completion_date, :completion_month, :budget_revenue, :budget_margin, :budget_margin
  json.url client_url(client, format: :json)
end
