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
#  survey_id  (survey_id => surveys.id)
#
class Question < ApplicationRecord

  enum question_type: [ :text, :choice ]

  belongs_to :survey
  has_many :options

  validates_presence_of :title, :question_type, :survey

  after_commit :generate_options_if_choice

  private

  def generate_options_if_choice
    if self.choice?
      options << Option.new(id: SecureRandom.uuid, title: 'Very Good')
      options << Option.new(id: SecureRandom.uuid, title: 'Good')
      options << Option.new(id: SecureRandom.uuid, title: 'Neutral')
      options << Option.new(id: SecureRandom.uuid, title: 'Bad')
      options << Option.new(id: SecureRandom.uuid, title: 'Very Bad')
    elsif self.text?
      options.destroy_all
    end
  end

end
