class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :chatwork_id, :string
  end
end
