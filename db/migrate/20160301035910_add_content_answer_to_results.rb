class AddContentAnswerToResults < ActiveRecord::Migration
  def change
    add_column :results, :content_answer, :string
  end
end
