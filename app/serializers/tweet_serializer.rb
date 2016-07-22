class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :user, :created_at

  def user
    {name: object.user.name, id: object.user_id }
  end
end
