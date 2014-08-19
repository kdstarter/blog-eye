class ChangeEmailToPublic < ActiveRecord::Migration
  def change
    change_column :users, :is_email_public, :boolean, default: true
  end
end
