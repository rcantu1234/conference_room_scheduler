# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: "#{n}/#{n}/#{n}",
    email: "test#{n}@example.com",
    password: "password",
    favorite_color: "Red"
    })
end

8.times do |n|
  Room.create!({
                name: "Room #{n}",
                location: "Bldg #{n}",
                description: Faker::Lorem.sentence,
    })
end

10.times do |n|
  Meeting.create!({
                    name: "MY MEETING #{n}",
                    user_id: Random.rand(1..10),
                    room_id: Random.rand(1..8),
                    start_time: DateTime.now - n.hour,
                    end_time: DateTime.now - 1.day - n.hours
                  })
end

10.times do |n|
    Feedback.create!({
                    message: Faker::Lorem.sentence,
                    user_id: Random.rand(1..10),
                    meeting_id: Random.rand(1..10)
        })
end
