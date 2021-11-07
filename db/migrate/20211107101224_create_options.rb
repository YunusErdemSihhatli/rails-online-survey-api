class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options, id: :uuid  do |t|
      t.text :title, null: false
      t.references :question, null: false, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
