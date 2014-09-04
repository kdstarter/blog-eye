ActiveAdmin.register Code do
  permit_params do
    permitted = Code.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
