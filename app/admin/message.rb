ActiveAdmin.register Message do

  permit_params do
    permitted = Message.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
