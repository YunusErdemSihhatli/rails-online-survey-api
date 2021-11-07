class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.text :title, null: false
      t.integer :question_type, null: false
      t.references :survey, null: false, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
