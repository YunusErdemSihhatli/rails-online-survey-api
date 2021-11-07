require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest

  setup do
    @survey = surveys(:one)
  end

  test "should get survey" do
    get survey_url(@survey)
  end

  test "should not get survey" do
    get survey_url('123')
  end

  test "should create feedback and responses" do
    assert_difference('Feedback.count') do
      assert_difference("Response.count", @survey.questions.count) do
        post surveys_url(@survey), params: {
          "responses[0][question_id]" => @survey.questions.text.first.id,
          "responses[0][body]" => 'body',
          "responses[1][question_id]" => @survey.questions.choice.first.id,
          "responses[1][option_id]" => @survey.questions.choice.first.options.first.id,
        }
      end
    end
  end

  test "should not create feedback and responses without body and option" do
    assert_difference('Feedback.count') do
      assert_no_difference("Response.count") do
        post surveys_url(@survey), params: {
          "responses[0][question_id]" => @survey.questions.text.first.id,
          "responses[1][question_id]" => @survey.questions.choice.first.id,
        }
      end
    end
  end
  
end
