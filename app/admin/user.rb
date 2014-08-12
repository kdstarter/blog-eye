ActiveAdmin.register User do

  permit_params do
    permitted = User.attribute_names.reject {|field| field == 'id' }
    permitted.delete('reset_password_token') if params[:user][:reset_password_token].blank?
    permitted
  end

   index do
    # selectable_column
    column :id # column_id
    column :ranking
    column :visits
    column :uid
    column :email
    column :name
    column :city_name
    column :homepage
    column :company
    actions
  end

end
