class Tweet < ApplicationRecord
  belongs_to :user
  has_many :tildetaggings
  has_many :tildetags, through: :tildetaggings
  validates :body, presence: true
  validates :body, length: {maximum: 160}
  after_save :create_tildetags, on: :create
  # default_scope {order(:created_at)}   This means that every time posts are gotten ANYWHERE, they will be ordered by created_at.

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

#3bf722b2e45895459bd1

private

  def create_tildetags
    post_words = body.split
    post_words.each do |word|
      if word.start_with?("~")
        self.tildetags << Tildetag.find_or_create_by(name: word)
      end
    end
  end


end
