class ChangeTimeTypeInSubjects < ActiveRecord::Migration
  def change
    change_column :subjects, :duration, :integer
  end
end
