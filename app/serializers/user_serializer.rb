class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :zipcode
end
