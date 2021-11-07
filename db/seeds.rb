# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

survey = Survey.create(id: SecureRandom.uuid, name: 'New Survey')
question1 = Question.create(id: SecureRandom.uuid, title: 'New Question1', question_type: :text, survey: survey)
question2 = Question.create(id: SecureRandom.uuid, title: 'New Question2', question_type: :choice, survey: survey)
feedback = Feedback.create(id: SecureRandom.uuid, survey: survey)
responses = Response.create([
  { id: SecureRandom.uuid, body: 'New Response1', question: question1, feedback: feedback },
  { id: SecureRandom.uuid, question: question2, option: question2.options.first, feedback: feedback },
])
