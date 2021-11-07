# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SurveyTest < ActiveSupport::TestCase

  test "should save survey" do
    survey = Survey.new(name: 'New Survey')
    assert survey.valid?
  end

  test "should not save survey without name" do
    survey = Survey.new(name: nil)
    assert_not survey.valid?
  end

  test "should not save survey without blank name" do
    survey = Survey.new(name: '')
    assert_not survey.valid?
  end

  test "should not save survey" do
    survey = Survey.new
    assert_not survey.save
  end

end
