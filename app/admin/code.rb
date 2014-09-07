ActiveAdmin.register Code do
  permit_params do
    permitted = Code.attribute_names.reject {|field| field == 'id' }
    permitted
  end

  index do
    selectable_column
    column :id
    column :title
    column :tags
    column :content
    column :created_at
    actions
  end
end
