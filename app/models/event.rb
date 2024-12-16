class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :event_registered_users, dependent: :destroy
  has_many :items, dependent: :destroy
  has_one :jackpot, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_one :album, dependent: :destroy
  accepts_nested_attributes_for :event_dates, allow_destroy: true
  has_many :invited_users, through: :event_registered_users, source: :user

  # validates :name, :address, presence: true
end
