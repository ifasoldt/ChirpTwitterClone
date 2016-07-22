class User < ApplicationRecord
  has_many :tweets
  acts_as_follower
  acts_as_followable
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  before_validation :generate_token, on: :create


  def suggested_people_to_follow
    User.where.not(id: followees(User, pluck: :id)).where.not(id: id).limit(5)
  end

  def timeline_tweets
    Tweet.timeline(self)
  end


private

  def generate_token
    while token.blank? || User.exists?(token: token)
      self.token = SecureRandom.hex(10)
    end
  end
end
