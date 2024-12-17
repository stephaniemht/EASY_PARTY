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

user1 = User.create!(email: "toto@gmail.com", password: "azerty", first_name: "Toto", last_name: "Toto", phone_number: "+33603757432")
user2 = User.create!(email: "tata@gmail.com", password: "azerty", first_name: "Tata", last_name: "Tata", phone_number: "")
user3 = User.create!(email: "tonton@gmail.com", password: "azerty", first_name: "Tonton", last_name: "Tonton", phone_number: "+33603757432")
user4 = User.create!(email: "titi@gmail.com", password: "azerty", first_name: "Titi", last_name: "Titi", phone_number: "+33624963715")

event1 = Event.create!(name: "Noel des copains", address: "79 la Canebière", user_id: user1.id)
event2 = Event.create!(name: "Galette des rois", address: "26 rue de la république", user_id: user1.id)
event3 = Event.create!(name: "Halloween", address: "397 corniche kennedy", user_id: user2.id)
event4 = Event.create!(name: "Surprise pour Jacques", address: "70 av du prado", user_id: user3.id)
event5 = Event.create!(name: "Fête de la musique", address: "38 Quaie rive-neuve", user_id: user3.id)

EventRegisteredUser.create(user_id: user4.id, event_id: event1.id)
EventRegisteredUser.create(user_id: user2.id, event_id: event1.id)

puts "#{User.count} Users are created"
puts "#{Event.count} Events are created"
