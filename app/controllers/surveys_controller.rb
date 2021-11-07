class SurveysController < ApplicationController

  before_action :get_survey

  def show
    render json: @survey.as_json(only: [:id, :name]).merge(
      feedbacks: @survey.feedbacks.map{ |feedback|
        feedback.as_json(only: [:id]).merge(
          responses: feedback.responses.map{ |response|
            response.as_json(only: [:id, :body]).merge(question: response.question.as_json(only: [:id, :title, :question_type])).merge(option: response.option.as_json(only: [:id, :title]))
          }
        )
      }
    )
  end

  def create
    feedback = Feedback.new(survey: @survey)
    if feedback.save
      saved = true
      @survey.questions.each_with_index do |question, index|
        response = params[:responses][index.to_s]
        new_response = Response.new
        new_response.feedback = feedback
        new_response.body = response[:body] if response[:body].present?
        new_response.question_id = response[:question_id]
        new_response.option_id = response[:option_id] if response[:option_id].present?
        if !new_response.save!
          saved = false
        end
      end
      if saved
        render json: { message: "Response saved" }, status: :ok
      else
        render json: { message: "Response can't save!" }, status: :internal_server_error
      end
    else
      render json: { message: "Feedback can't save!" }, status: :internal_server_error
    end
  end

  private

  def get_survey
    @survey = Survey.find_by(id: params[:id])
    if !@survey.present?
      render json: { message: 'Survey not found!'}, status: 404
    end
  end

end
