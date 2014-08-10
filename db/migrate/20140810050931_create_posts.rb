class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :point_id
      t.integer :category_id

      t.integer :source
      t.integer :visits, default: 0
      t.integer :likes, default: 0

      t.string :title
      t.text :content
      t.string :tags

      t.timestamps
    end
  end
end
