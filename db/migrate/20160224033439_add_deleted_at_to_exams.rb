class AddDeletedAtToExams < ActiveRecord::Migration
  def change
    add_column :exams, :deleted_at, :datetime
    add_index :exams, :deleted_at
  end
end
