# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'

EventRegisteredUser.destroy_all
Event.destroy_all
User.destroy_all



User.create!(email: "belin.nicolas89@gmail.com", password: "azerty", first_name: "Nicolas", last_name: "Belin", phone_number: "+33603757432")
file1 = URI.parse("https://avatars.githubusercontent.com/u/168406452?v=4").open
user1 = User.all[0].photo.attach(io: file1, filename: "user-1", content_type: "image/png")

User.create!(email: "stephanie.mihut@gmail.com", password: "azerty", first_name: "Stéphanie", last_name: "Mihut", phone_number: "+33787959448")
file2 = URI.parse("https://avatars.githubusercontent.com/u/185727407?v=4").open
user2 =  User.all[1].photo.attach(io: file2, filename: "user-2", content_type: "image/png")

User.create!(email: "gerardbonnaudfo14@gmail.com", password: "azerty", first_name: "Gerard", last_name: "Bonnaud", phone_number: "+33624963715")
file3 = URI.parse("https://avatars.githubusercontent.com/u/185676966?v=4").open
user3 = User.all[2].photo.attach(io: file3, filename: "user-3", content_type: "image/png")

User.create!(email: "davitavanesyan@gmail.com", password: "azerty", first_name: "Davit", last_name: "Avanesyan", phone_number: "+33603757433")
file4 = URI.parse("https://avatars.githubusercontent.com/u/121693629?v=4").open
user4 = User.all[3].photo.attach(io: file4, filename: "user-4", content_type: "image/png")

User.create!(email: "eliecelka@gmail.com", password: "azerty", first_name: "Elie", last_name: "Celka", phone_number: "+33787959447", avatar: "")
file5 = URI.parse("https://avatars.githubusercontent.com/u/183768747?v=4").open
user5 = User.all[4].photo.attach(io: file5, filename: "user-5", content_type: "image/png")

User.create!(email: "sabrinamehelleb@gmail.com", password: "azerty", first_name: "Sabrina", last_name: "Mehelleb", phone_number: "+33624963714")
file6 = URI.parse("https://avatars.githubusercontent.com/u/185536768?v=4").open
user6 = User.all[5].photo.attach(io: file6, filename: "user-6", content_type: "image/png")

User.create!(email: "nicolaslanfranchi@gmail.com", password: "azerty", first_name: "Nicolas", last_name: "Lanfranchi", phone_number: "+33603757438")
file7 = URI.parse("https://avatars.githubusercontent.com/u/185539912?v=4").open
user7 = User.all[6].photo.attach(io: file7, filename: "user-7", content_type: "image/png")

User.create!(email: "jeremysebban@gmail.com", password: "azerty", first_name: "Jeremy", last_name: "Sebban", phone_number: "+33787959449")
file8 = URI.parse("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBemQ3QXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--9660323b03c079c93e99e7013a2360d3801bb7e7/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/IMG_2363.jpg").open
user8 = User.all[7].photo.attach(io: file8, filename: "user-8", content_type: "image/png")

User.create!(email: "benjaminmasson@gmail.com", password: "azerty", first_name: "Benjamin", last_name: "Masson", phone_number: "+33624963719")
file9 = URI.parse("https://avatars.githubusercontent.com/u/180395610?v=4").open
user9 = User.all[8].photo.attach(io: file9, filename: "user-9", content_type: "image/png")

puts "#{User.count} Users are created"
