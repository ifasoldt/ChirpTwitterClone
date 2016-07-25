class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :picture_url, :followers_count, :followees_count, :tweet_count, :currently_being_followed

  def currently_being_followed
    current_user.follows?(object)
  end
end
