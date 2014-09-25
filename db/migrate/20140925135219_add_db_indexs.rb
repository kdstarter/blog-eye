class AddDbIndexs < ActiveRecord::Migration
  def change
    add_index :categories, :user_id

    add_index :codes, :user_id
    add_index :codes, :category_id
    add_index :codes, :language_id

    add_index :messages, :user_id
    add_index :messages, [:target_id, :target_type]

    add_index :posts, :user_id
    add_index :posts, :point_id
    add_index :posts, :category_id

    add_index :replies, :user_id
    add_index :replies, :post_id
  end
end
