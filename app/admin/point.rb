ActiveAdmin.register Point do

  permit_params do
    permitted = Point.attribute_names.reject {|field| field == 'id' }
    permitted
  end

end
