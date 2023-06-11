# Remove everything from the database

GroupUser.destroy_all
Group.destroy_all
User.destroy_all

# Create a users

100.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: "password",
    admin: i % 10 == 0,
    confirmed_at: Time.now
  )
end