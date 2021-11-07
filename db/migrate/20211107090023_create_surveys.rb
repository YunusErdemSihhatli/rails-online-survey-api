class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys, id: :uuid do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
