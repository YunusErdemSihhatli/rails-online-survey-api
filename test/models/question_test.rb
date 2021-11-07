# == Schema Information
#
# Table name: questions
#
#  id            :uuid             not null, primary key
#  question_type :integer          not null
#  title         :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  survey_id     :uuid             not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase

  setup do
    @survey = surveys(:two)
  end

  test "should save question with text type" do
    question = Question.new(title: 'New Question Text', question_type: :text, survey: @survey)
    assert question.valid?
    assert_equal true, question.save
    assert_equal 0, question.options.count
  end

  test "should save question with text choice" do
    question = Question.new(title: 'New Question Choice', question_type: :choice, survey: @survey)
    assert question.valid?
    assert_equal true, question.save
    assert_not_equal 0, question.options.count
  end

  test "should not save question without title" do
    question = Question.new(question_type: :text, survey: @survey)
    assert_not question.valid?
  end

  test "should not save question without type" do
    question = Question.new(title: 'New Question Choice', survey: @survey)
    assert_not question.valid?
  end

  test "should not save question without survey" do
    question = Question.new(title: 'New Question Choice', question_type: :text)
    assert_not question.valid?
  end

end
