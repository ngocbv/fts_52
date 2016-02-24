class ChangeUserIdColumnInAdminLogs < ActiveRecord::Migration
  def change
    rename_column :admin_logs, :user_id_id, :user_id
  end
end
