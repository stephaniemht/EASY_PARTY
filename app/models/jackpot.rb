class Jackpot < ApplicationRecord
  belongs_to :event
  has_many :monney_addeds
end
