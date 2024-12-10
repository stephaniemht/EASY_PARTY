class Event < ApplicationRecord
  belongs_to :user
  has_many :event_registered_users
  has_many :users, through: :event_registered_users
  has_many :items
  has_many :jackpots
  has_many :event_dates

  # validates :name, :address, presence: true
end
