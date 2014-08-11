ActiveAdmin.register Post do

  permit_params do
    permitted = Post.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
