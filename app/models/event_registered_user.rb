class EventRegisteredUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :status, inclusion: { in: %w[pending accepted declined] }

  enum status: { pending: "En attente", accept: "Accepté", decline: "Refusé" }
end
