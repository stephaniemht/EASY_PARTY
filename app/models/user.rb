class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :event_registered_users
  has_many :monney_addeds
  has_many :events
  has_many :event_dates
  has_many :event_dates, through: :votes
  has_many :votes
  has_many :items
  # has_one_attached :photo

  # validates :first_name, :last_name, :phone_number, presence: true
end
