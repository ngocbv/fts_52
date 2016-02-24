class AddDeletedAtToResults < ActiveRecord::Migration
  def change
    add_column :results, :deleted_at, :datetime
    add_index :results, :deleted_at
  end
end
