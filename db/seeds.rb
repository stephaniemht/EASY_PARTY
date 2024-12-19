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


puts "#{User.count} Users are created"
