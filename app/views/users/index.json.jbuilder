json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :date_of_birth, :favorite_color
  json.url user_url(user, format: :json)
end
