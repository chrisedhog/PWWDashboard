json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :company_name, :country, :city, :direct_number, :position, :user_id
  json.url profile_url(profile, format: :json)
end
