# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

EventRegisteredUser.destroy_all
Event.destroy_all
User.destroy_all


user1 = User.create(email: "toto@gmail.com", password: "azerty")
user2 = User.create(email: "tata@gmail.com", password: "azerty")
user3 = User.create(email: "tonton@gmail.com", password: "azerty")
user4 = User.create(email: "titi@gmail.com", password: "azerty")

event1 = Event.create(name: "Noel des copains", user_id: user1.id)
event2 = Event.create(name: "Galette des rois", user_id: user1.id)
event3 = Event.create(name: "Halloween", user_id: user2.id)
event4 = Event.create(name: "Surprise pour Jacques", user_id: user3.id)
event5 = Event.create(name: "Fête de la musique", user_id: user3.id)

EventRegisteredUser.create(user_id: user4.id, event_id: event1.id)

puts "#{User.count} Users are created"
puts "#{Event.count} Events are created"