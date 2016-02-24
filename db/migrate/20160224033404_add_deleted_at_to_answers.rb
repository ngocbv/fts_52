class AddDeletedAtToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :deleted_at, :datetime
    add_index :answers, :deleted_at
  end
end
