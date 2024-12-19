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

user1 = User.create!(email: "belin.nicolas89@gmmail.com.com", password: "azerty", first_name: "Nicolas", last_name: "Belin", phone_number: "+33603757432", avatar: "https://avatars.githubusercontent.com/u/168406452?v=4")
user2 = User.create!(email: "stephanie.mihut@gmail.com", password: "azerty", first_name: "Stéphanie", last_name: "Mihut", phone_number: "+33787959448", avatar: "https://avatars.githubusercontent.com/u/185727407?v=4")
user3 = User.create!(email: "gerardbonnaud@gmail.com", password: "azerty", first_name: "Gerard", last_name: "Bonnaud", phone_number: "+33624963715", avatar: "https://avatars.githubusercontent.com/u/185676966?v=4")

event1 = Event.create!(name: "Noel des copains", address: "79 la Canebière", user_id: user1.id)
event2 = Event.create!(name: "Galette des rois", address: "26 rue de la république", user_id: user1.id)
event3 = Event.create!(name: "Halloween", address: "397 corniche kennedy", user_id: user2.id)
event4 = Event.create!(name: "Surprise pour Jacques", address: "70 av du prado", user_id: user3.id)
event5 = Event.create!(name: "Fête de la musique", address: "38 Quaie rive-neuve", user_id: user3.id)

EventRegisteredUser.create(user_id: user4.id, event_id: event1.id)
EventRegisteredUser.create(user_id: user2.id, event_id: event1.id)

puts "#{User.count} Users are created"
puts "#{Event.count} Events are created"
