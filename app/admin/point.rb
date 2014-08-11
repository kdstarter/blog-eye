ActiveAdmin.register Point do

  permit_params do
    permitted = Point.attribute_names.reject {|field| field == 'id' }
    permitted
  end

  index do
    # selectable_column
    column :id
    column :name
    column :description
    column :created_at
    column :updated_at
    actions
  end

end
