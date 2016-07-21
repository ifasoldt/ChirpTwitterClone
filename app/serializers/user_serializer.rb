class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token, :picture_url
end
