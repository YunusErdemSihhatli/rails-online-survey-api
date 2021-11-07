# == Schema Information
#
# Table name: feedbacks
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid             not null
#
# Indexes
#
#  index_feedbacks_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
require "test_helper"

class FeedbackTest < ActiveSupport::TestCase

  setup do
    @survey = surveys(:two)
  end

  test "should save feedback" do
    feedback = Feedback.new(survey: @survey)
    assert feedback.valid?
  end

  test "should not save feedback without survey" do
    feedback = Feedback.new
    assert_not feedback.valid?
  end

end
