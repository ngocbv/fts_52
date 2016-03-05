class ChangeTimeTypeInExams < ActiveRecord::Migration
  def change
    change_column :exams, :spent_time, :integer, default: 0
  end
end
