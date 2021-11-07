# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_07_111043) do

# Could not dump table "feedbacks" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "options" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "questions" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "responses" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "surveys" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  add_foreign_key "feedbacks", "surveys"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "responses", "feedbacks"
  add_foreign_key "responses", "options"
  add_foreign_key "responses", "questions"
end
