json.array!(@helps) do |help|
  json.extract! help, :id, :title, :category, :access_level, :body, :anchor_id
  json.url help_url(help, format: :json)
end
