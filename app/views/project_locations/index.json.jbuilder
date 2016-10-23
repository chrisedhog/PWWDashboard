json.array!(@project_locations) do |project_location|
  json.extract! project_location, :id, :location, :region
  json.url project_location_url(project_location, format: :json)
end
