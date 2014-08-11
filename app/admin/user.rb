ActiveAdmin.register User do

  permit_params do
    permitted = User.attribute_names.reject {|field| field == 'id' }
    permitted
  end

   index do
    selectable_fields = User.attribute_names.reject {|field| 
      ['encrypted_password', 'reset_password_token'].include?(field) 
    }
    selectable_fields.each { |field| column field }
    actions
  end

end
