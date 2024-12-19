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

user1 = User.create!(email: "belin.nicolas89@gmail.com", password: "azerty", first_name: "Nicolas", last_name: "Belin", phone_number: "+33603757432", avatar: "https://avatars.githubusercontent.com/u/168406452?v=4")
user2 = User.create!(email: "stephanie.mihut@gmail.com", password: "azerty", first_name: "Stéphanie", last_name: "Mihut", phone_number: "+33787959448", avatar: "https://avatars.githubusercontent.com/u/185727407?v=4")
user3 = User.create!(email: "gerardbonnaudfo14@gmail.com", password: "azerty", first_name: "Gerard", last_name: "Bonnaud", phone_number: "+33624963715", avatar: "https://avatars.githubusercontent.com/u/185676966?v=4")
user4 = User.create!(email: "davitavanesyan@gmail.com", password: "azerty", first_name: "Davit", last_name: "Avanesyan", phone_number: "+33603757433", avatar: "https://avatars.githubusercontent.com/u/121693629?v=4")
user5 = User.create!(email: "eliecelka@gmail.com", password: "azerty", first_name: "Elie", last_name: "Celka", phone_number: "+33787959447", avatar: "https://avatars.githubusercontent.com/u/183768747?v=4")
user6 = User.create!(email: "sabrinamehelleb@gmail.com", password: "azerty", first_name: "Sabrina", last_name: "Mehelleb", phone_number: "+33624963714", avatar: "https://avatars.githubusercontent.com/u/185536768?v=4")
user7 = User.create!(email: "nicolaslanfranchi@gmail.com", password: "azerty", first_name: "Nicolas", last_name: "Lanfranchi", phone_number: "+33603757438", avatar: "https://avatars.githubusercontent.com/u/185539912?v=4")
user8 = User.create!(email: "jeremysebban@gmail.com", password: "azerty", first_name: "Jeremy", last_name: "Sebban", phone_number: "+33787959449", avatar: "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBemQ3QXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--9660323b03c079c93e99e7013a2360d3801bb7e7/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/IMG_2363.jpg")
user9 = User.create!(email: "benjaminmasson@gmail.com", password: "azerty", first_name: "Benjamin", last_name: "Masson", phone_number: "+33624963719", avatar: "https://avatars.githubusercontent.com/u/180395610?v=4")



puts "#{User.count} Users are created"
