# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def random_user
  User.offset(rand(User.count)).first
end

25.times do
  User.create!(password:"password", name:Faker::Name.name, email:Faker::Internet.email, picture_url: "http://photo.net/photodb/random-photo?category=Portraits", created_at: Faker::Time.between(5.weeks.ago, DateTime.now))
  puts "lets go"
end


150.times do
  user1 = random_user
  user2 = random_user
  until user1 != user2
    user2 = random_user
  end
  user1.follow!(user2)
  puts "ho"
end

3000.times do
  puts "hey"
  Tweet.create(body:Faker::Lorem.words((1..18).to_a.sample).join(" "), user_id: (1..25).to_a.sample, created_at:Faker::Time.between(DateTime.now - 500, DateTime.now))
end
