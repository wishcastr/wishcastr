json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :postal_code, :amz_id, :amz_access_token, :amz_raccess_token
  json.url user_url(user, format: :json)
end
