# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Board.destroy_all
Message.destroy_all

50.times do
  User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email, password: "pass123", bio:Faker::TvShows::Seinfeld.quote )
end

puts "seeded 50 users"

10.times do
  Board.create(name:Faker::TvShows::Seinfeld.unique.business, desc:Faker::TvShows::StrangerThings.quote )
end

puts "seeded 10 boards"

100.times do
  Membership.create(user_id:User.all.sample.id, board_id:Board.all.sample.id)
end

puts "seeded 100 memberships"

200.times do
  board = nil
  while !board
    user = User.all.sample
    board = user.boards.sample
  end
    Message.create(user_id: user.id, board_id: board.id, content: Faker::Movies::StarWars.quote)
end