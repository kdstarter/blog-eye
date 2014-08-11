ActiveAdmin.register Reply do

  permit_params do
    permitted = Reply.attribute_names.reject {|field| field == 'id' }
    permitted
  end

  index do
    selectable_column
    column :id
    column :user_id
    column :post_id
    column :last_reply_id
    column :is_public
    column :content
    column :created_at
    actions
  end

end
