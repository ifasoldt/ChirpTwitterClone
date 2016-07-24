class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :picture_url, :followers_count, :followees_count

  def followers
    object.followers(User)
  end

  def followees
    object.followees(User)
  end

  has_many :followers
  has_many :followees
  has_many :tweets

end
