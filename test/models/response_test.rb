# == Schema Information
#
# Table name: responses
#
#  id          :uuid             not null, primary key
#  body        :text             not null
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
#  feedback_id  (feedback_id => feedbacks.id)
#  option_id    (option_id => options.id)
#  question_id  (question_id => questions.id)
#
require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end