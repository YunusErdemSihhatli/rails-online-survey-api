# == Schema Information
#
# Table name: responses
#
#  id          :uuid             not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  feedback_id :uuid             not null
#  option_id   :uuid
#  question_id :uuid             not null
#
# Indexes
#
#  index_responses_on_feedback_id  (feedback_id)
#  index_responses_on_option_id    (option_id)
#  index_responses_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (feedback_id => feedbacks.id)
#  fk_rails_...  (option_id => options.id)
#  fk_rails_...  (question_id => questions.id)
#
class Response < ApplicationRecord

  belongs_to :question
  belongs_to :option, optional: true
  belongs_to :feedback

  validates_presence_of :question, :feedback

  before_validation :check_body_and_option

  private

  def check_body_and_option
    if question.text?
      if !body.present?
        errors.add(:body, :blank)
      end
    else
      if !option.present?
        errors.add(:option, :blank)
      end
    end
  end

end
