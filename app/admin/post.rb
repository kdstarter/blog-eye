ActiveAdmin.register Post do

  permit_params do
    permitted = Post.attribute_names.reject {|field| field == 'id' }
    permitted
  end

  index do
    # selectable_fields = Post.attribute_names.reject {|field| field == 'content' }
    # selectable_fields.each { |field| column field }
    selectable_column
    column :id
    column :user_id
    column :point_id
    column :category_id
    column :source
    column :title
    column :tags
    column :visits
    column :likes
    column :created_at
    actions
  end

end
