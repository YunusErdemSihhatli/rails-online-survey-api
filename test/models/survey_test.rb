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
    assert_equal true, Survey.create(id: SecureRandom.uuid, name: 'New Survey')
  end

end
