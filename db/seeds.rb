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
   # dob: "010101",
    email: "user-#{n}@example.com",
    password: "password",
    favorite_color: "Red",
    phone_number: Faker::PhoneNumber.cell_phone
    })
end

RubyOnRailsRoom = Room.new({
    name: 'Ruby on Rails Room',
    location: "C-1: Ruby on Rails Room",
    description: "Ruby on Rails Programming Room at The Iron Yard."
})
RubyOnRailsRoom.photo = File.new(Rails.root.join('app', 'assets', 'images', "C1-Ruby_on_Rails_Room.jpg"))
RubyOnRailsRoom.save!

KitchenRoom = Room.new({
                name: "The Kitchen Room",
                location: "C-2: Kitchen Room",
                description: "Kitchen for students at The Iron Yard."
    })
KitchenRoom.photo = File.new(Rails.root.join('app', 'assets', 'images', "C2-Kitchen_Room.jpg"))
KitchenRoom.save!

WebDesignRoom = Room.new({
                name: "The Web-Design Room",
                location: "C-3: Web-Design Room",
                description: "Web-Design Programming Room for students at The Iron Yard."
    })
WebDesignRoom.photo = File.new(Rails.root.join('app', 'assets', 'images', "C3-Web_Design_Room.jpg"))
WebDesignRoom.save!

CoWorkingRoom = Room.new({
                name: "The Co-Working Room",
                location: "C-4: Co-Working Room",
                description: "Co-Working Room at The Iron Yard."
    })
CoWorkingRoom.photo = File.new(Rails.root.join('app', 'assets', 'images', "C4-Co_Working_Room.jpg"))
CoWorkingRoom.save!

# 8.times do |n|
#   Room.create!({
#                 name: "Room #{n}",
#                 location: "Bldg #{n}",
#                 description: Faker::Lorem.sentence,
#     })
# end

# 10.times do |n|
#   Meeting.create!({
#                     name: "MY MEETING #{n}",
#                     user_id: Random.rand(1..10),
#                     room_id: Random.rand(1..8),
#                     start_time: DateTime.now - n.hour,
#                     end_time: DateTime.now - 1.day - n.hours
#                   })
# end

# 10.times do |n|
#     Feedback.create!({
#                     message: Faker::Lorem.sentence,
#                     user_id: Random.rand(1..10),
#                     meeting_id: Random.rand(1..10)
#         })
# end
