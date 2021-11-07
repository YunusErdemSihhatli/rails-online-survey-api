class CreateResponses < ActiveRecord::Migration[6.1]
  create_table :responses, id: :uuid do |t|
    t.text :body, null: false
    t.references :question, null: false, index: true, foreign_key: true, type: :uuid
    t.references :option, index: true, foreign_key: true, type: :uuid
    t.references :feedback, null: false, index: true, foreign_key: true, type: :uuid

    t.timestamps
  end
end
