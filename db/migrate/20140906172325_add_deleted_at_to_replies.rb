
class AddDeletedAtToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :deleted_at, :datetime
    add_index :replies, :deleted_at
  end
end
