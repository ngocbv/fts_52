class AddDeletedAtToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :deleted_at, :datetime
    add_index :subjects, :deleted_at
  end
end
