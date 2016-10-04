json.array!(@clients) do |client|
  json.extract! client, :id, :client_name, :country, :region, :company
  json.url client_url(client, format: :json)
end
