class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :picture_url, :followers_count, :followees_count, :tweet_count
end
