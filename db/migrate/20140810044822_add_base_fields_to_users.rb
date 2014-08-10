class AddBaseFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :name, :string

    add_column :users, :is_email_public, :boolean
    add_column :users, :city_name, :string
    add_column :users, :company, :string

    add_column :users, :github, :string
    add_column :users, :homepage, :string
    add_column :users, :signature, :string
    add_column :users, :description, :text

    add_column :users, :ranking, :integer
    add_column :users, :visits, :integer, default: 0
  end
end
