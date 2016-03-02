class ChangeActionTypeInAdminLogs < ActiveRecord::Migration
  def change
    change_column :admin_logs, :action, :integer
  end
end
