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
#  survey_id  (survey_id => surveys.id)
#
class Feedback < ApplicationRecord

  belongs_to :survey

  validates_presence_of :survey, :question

end
