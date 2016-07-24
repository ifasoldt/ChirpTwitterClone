class CurrentUserSerializer < ActiveModel::Serializer

  #new user serializer that only returns token. This will go to user controller timeline. Timeline needs to be included.
  attributes :token
end
