# == Schema Information
#
# Table name: options
#
#  id          :uuid             not null, primary key
#  title       :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :uuid             not null
#
# Indexes
#
#  index_options_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require "test_helper"

class OptionTest < ActiveSupport::TestCase

  setup do
    @question = questions(:two)
  end

  test "should save option" do
    option = Option.new(title: 'New Option', question: @question)
    assert option.valid?
  end

  test "should not save option without question" do
    option = Option.new(title: 'New Option')
    assert_not option.valid?
  end

  test "should save option without title" do
    option = Option.new(question: @question)
    assert_not option.valid?
  end

end
