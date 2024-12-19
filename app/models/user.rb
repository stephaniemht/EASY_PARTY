class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :event_registered_users
  has_many :monney_addeds
  has_many :events
  has_many :event_dates, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :items
  has_one_attached :photo
  has_many :invited_events, through: :event_registered_users, source: :event

  validates :first_name, :last_name, :phone_number, :email, presence: true
end
