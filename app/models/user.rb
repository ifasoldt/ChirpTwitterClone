class User < ApplicationRecord
  has_many :tweets
  acts_as_follower
  acts_as_followable
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  before_validation :generate_token, on: :create


  # def suggested_people_to_follow
  #   if second_degree_followees.length < 5
  #     second_degree_followees << User.where.not(id: followees(User, pluck: :id)).where.not(id: id).limit(5 - second_degree_followees.length)
  #   end
  #   second_degree_followees
  # end

  def self.searched_users(params)
    User.where("name ILIKE ? OR email ILIKE ?", "%#{params}%", "%#{params}%").order(:name)
  end

  def suggested_people_to_follow
    second_degree_followees
    puts second_degree_followees.inspect
    suggested_followees = []
    suggested_followees << User.order("RANDOM()").limit(5).where(id: second_degree_followees.pluck(:id)).where.not(id: followees(User, pluck: :id)).where.not(id: id)
    #why can't make this a helper method in private?
    suggested_followees.flatten!
    if suggested_followees.length < 5
      suggested_followees << User.order("RANDOM()").where.not(id: followees(User, pluck: :id)).where.not(id: id).limit(5 - suggested_followees.length)
      suggested_followees.flatten!
    end
    suggested_followees
  end


  def timeline_tweets
    Tweet.timeline(self)
  end

  def


private

  def second_degree_followees
    second_degree_followees = []
    followees(User).each do |followee|
      second_degree_followees << followee.followees(User)
      second_degree_followees.flatten!
    end
    second_degree_followees
  end

  # def make_suggested_followees_length_five
  #   puts "hi!"
  #   if suggested_followees.length < 5
  #     puts "hi!"
  #     suggested_followees << User.where.not(id: followees(User, pluck: :id)).where.not(id: id).limit(5 - suggested_followees.length)
  #   end
  #   suggested_followees
  # end

  def generate_token
    while token.blank? || User.exists?(token: token)
      self.token = SecureRandom.hex(10)
    end
  end
end
