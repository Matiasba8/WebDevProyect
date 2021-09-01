class Lodging < ApplicationRecord
  belongs_to :user
  has_many :lodging_reviews
  has_many :reservations
  has_one_attached :photo
  has_one_attached :video
  validates :title, :location, :description, :amenities, :facilities, :equipment, presence: true
end
