ActiveAdmin.register Category do

  permit_params do
    permitted = Category.attribute_names.reject {|field| field == 'id' }
    permitted
  end

   index do
    selectable_column
    column :id
    column :point_id
    column :name
    column :description
    column :created_at
    column :updated_at
    actions
  end
end
