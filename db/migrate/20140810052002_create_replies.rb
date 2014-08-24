class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :last_reply_id
      t.text :content
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
