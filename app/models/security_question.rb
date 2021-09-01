class SecurityQuestion < ApplicationRecord
  belongs_to :user
  validates :question, :answer, presence: true
  validate :question_unique_for_user

  def question_unique_for_user
    User.find(user.id).security_questions.each do |q|
      errors.add(:question, "repeated for user_id: #{user_id}") if q.question == question
    end
  end
end
