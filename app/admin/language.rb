ActiveAdmin.register Language do

  permit_params do
    permitted = Language.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
