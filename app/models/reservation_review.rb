class ReservationReview < ApplicationRecord
  belongs_to :reservation
  validates :description, presence: true, length: { minimum: 3 }
  validates :rate, presence: true, length: { in: 1...5 }  # rate range(1,5) inclusive
end
