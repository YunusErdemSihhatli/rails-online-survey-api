# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Survey < ApplicationRecord

  has_many :questions

  validates_presence_of :name

end
