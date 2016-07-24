class Tweet < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :body, length: {maximum: 160}

  def self.timeline(user)
    if user.followees(User)
      following_ids = user.followees(User).pluck(:id)
      all_ids = following_ids << user.id
    else
      all_ids = user.id
    end
    Tweet.where(user_id: all_ids).order("created_at DESC")
  end

  def self.searched_tweets(params)
    Tweet.where("body ILIKE ?", "%#{params}%").order("created_at DESC")
  end

end
