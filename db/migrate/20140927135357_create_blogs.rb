class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :category
      t.integer :status

      t.timestamps
    end
  end
end
