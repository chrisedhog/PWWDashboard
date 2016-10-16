json.array!(@clients) do |client|
  json.extract! client, :id, :client_name, :country, :location, :company, :prior_year, :business_plan, :q1_forecast, :q2_forecast, :q3_forecast, :q4_forecast, :project_id
  json.url client_url(client, format: :json)
end
