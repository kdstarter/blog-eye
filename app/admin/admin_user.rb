ActiveAdmin.register AdminUser do

  permit_params :email, :password, :password_confirmation

  index do
    # selectable_column
    column :id
    column :email
    column :last_sign_in_at
    column :failed_attempts
    column :sign_in_count
    column :created_at
    column :locked_at
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
