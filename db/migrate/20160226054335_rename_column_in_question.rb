class RenameColumnInQuestion < ActiveRecord::Migration
  def change
    rename_column :questions, :created_by, :user_id
  end
end
