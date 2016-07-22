class CurrentUserSerializer < ActiveModel::Serializer

  #new user serializer that only returns token. This will go to user controller timeline. Timeline needs to be included.
  attributes :id, :name, :token, :email, :picture_url, :followers, :followees, :followers_count, :followees_count, :suggested_people_to_follow

  def followers
    object.followers(User)
  end

  def followees
    object.followees(User)
  end
end
