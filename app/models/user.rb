class User < ApplicationRecord
  has_many :guest_reviews, dependent: :destroy
  has_many :security_questions, dependent: :destroy
  has_many :report_requests, dependent: :destroy
  has_many :received_messages, dependent: :destroy
  has_many :lodgings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  # bio , phone_num, location optional

  validates :first_name, :last_name, :current_role, :password, presence: true
  validates :email, presence: true, email: true
  validates :username, :email, presence: true, uniqueness: true

  accepts_nested_attributes_for :lodgings, allow_destroy: true

end
