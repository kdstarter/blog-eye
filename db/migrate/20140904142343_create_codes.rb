class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :language_id

      t.string :title
      t.string :source
      t.string :tags
      t.text :content

      t.timestamps
    end
  end
end
