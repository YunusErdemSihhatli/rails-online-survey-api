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
class Option < ApplicationRecord

  belongs_to :question

  validates_presence_of :title, :question

end
