class Event < ApplicationRecord
  belongs_to :user
  has_many :event_registered_users, dependent: :destroy
  has_many :items, dependent: :destroy
  has_one :jackpot, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_one :album, dependent: :destroy
  accepts_nested_attributes_for :event_dates, allow_destroy: true
  attr_accessor :event_option, :item_content

  # validates :name, :address, presence: true
end
