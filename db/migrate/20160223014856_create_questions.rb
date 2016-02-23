class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :question_type, default: 0
      t.integer :state, default: 0
      t.references :subject, index: true, foreign_key: true
      t.integer :created_by
      t.integer :accepted_by

      t.timestamps null: false
    end
  end
end
