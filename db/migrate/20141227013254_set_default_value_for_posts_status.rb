class SetDefaultValueForPostsStatus < ActiveRecord::Migration
  def change
    change_column :posts, :status, :integer, default: 1
  end
end
