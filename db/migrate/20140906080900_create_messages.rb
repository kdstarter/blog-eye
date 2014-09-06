class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :from_user_id
      t.string :code
      t.string :body
      t.string :target_type
      t.integer :target_id
      t.boolean :is_read, default: false

      t.timestamps
    end
  end
end
