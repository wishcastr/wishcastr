class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :postal_code, :amz_id, :amz_access_token, :amz_raccess_token
end
