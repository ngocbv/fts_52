class AddColumnToExams < ActiveRecord::Migration
  def change
    add_column :exams, :duration, :integer
    add_column :exams, :question_num, :integer
  end
end
