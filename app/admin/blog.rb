ActiveAdmin.register Blog do
  permit_params do
    permitted = Blog.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
