class EventRegisteredUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :status, inclusion: { in: ["pending", "accepted", "declined"] }

  enum status: { pending: "En attente", accepted: "Accepté", declined: "Refusé" }
end
