class Vote < ApplicationRecord
  belongs_to :event_date
  belongs_to :user

  validates :user_id, uniqueness: { scope: event_date_id, message: "Vous avez déjà voté pour cette date." }
end
