ActiveAdmin.register Reply do

  permit_params do
    permitted = Reply.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
