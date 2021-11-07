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
require "test_helper"

class ResponseTest < ActiveSupport::TestCase

  setup do
    @survey = surveys(:one)
    @feedback = feedbacks(:two)
    @question_one = questions(:one)
    @question_two = questions(:two)
  end

  test "should save response with text type question" do
    response = Response.new(body: 'body', question: @question_one, feedback: @feedback)
    assert response.valid?
  end

  test "should save response with choice type question" do
    response = Response.new(option: @question_two.options.first, question: @question_two, feedback: @feedback)
    assert response.valid?
  end

  test "should not save response without body with text type question" do
    response = Response.new(question: @question_one, feedback: @feedback)
    assert_not response.valid?
  end

  test "should not save response without option with choice type question" do
    response = Response.new(question: @question_two, feedback: @feedback)
    assert_not response.valid?
  end

end
