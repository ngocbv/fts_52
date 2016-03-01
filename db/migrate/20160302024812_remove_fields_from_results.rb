class RemoveFieldsFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :answer_text, :string
    remove_column :results, :answer_id, :integer
  end
end
