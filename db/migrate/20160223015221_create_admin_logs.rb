class CreateAdminLogs < ActiveRecord::Migration
  def change
    create_table :admin_logs do |t|
      t.string :action
      t.references :user_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
