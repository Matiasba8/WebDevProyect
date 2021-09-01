class Reservation < ApplicationRecord
  belongs_to :lodging
  belongs_to :user
  has_many :reservation_reviews
  validates :start_date, :end_date, :daily_fee, presence: true
  validate :start_end_date # start_date should be < end_date

  def start_end_date
    errors.add(:start_date, "not valid") unless start_date < end_date
  end

end
