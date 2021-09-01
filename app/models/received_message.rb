class ReceivedMessage < ApplicationRecord
  belongs_to :user
  validates :user_id, :from_user_id, :body, :purpose, presence: true
end
