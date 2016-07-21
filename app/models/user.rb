class User < ApplicationRecord
  has_many :tweets
  acts_as_follower
  acts_as_followable
  has_secure_password
  validates :token, presence: true, uniqueness: true
  before_validation :generate_token, on: :create

  private

  def generate_token
    while token.blank? || User.exists?(token: token)
      self.token = SecureRandom.hex(10)
    end
  end
end
