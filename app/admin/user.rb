ActiveAdmin.register User do

  permit_params do
    permitted = User.attribute_names.reject {|field| field == 'id' }
    if params[:user].present? && [:reset_password_token].blank?
      permitted.delete('reset_password_token')
    end
    permitted
  end

   index do
    # selectable_column
    column :id # column_id
    column :visits
    column :uid
    column :email
    column :name
    column :city_name
    column :company
    column :last_sign_in_at
    column :created_at
    actions
  end

end
