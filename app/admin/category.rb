ActiveAdmin.register Category do

  permit_params do
    permitted = Category.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
