require 'rails_helper'

RSpec.describe Admin::PostsController, :type => :controller do
  let(:post) {
    create(:valid_post,
        user: build_stubbed(:valid_user),
        point: build_stubbed(:valid_point),
        category: build_stubbed(:valid_category)
  ) }

  describe ":index" do
    it "should show all posts" do
      sign_in
      get :index
      visit admin_posts_path
      expect(response.status).to be(200)
    end
  end

  describe ":show" do
    it "should show one post exactly" do
      sign_in
      get :show, id: post.id
      visit admin_post_path(post)
      expect(response.status).to be(200)
    end
  end

  describe ":new" do
    it "should show new post page" do
      sign_in
      get :new
      expect(response.status).to be(200)
    end
  end

  describe ":create" do
    it "should create post failed with invalid field" do
      sign_in
      invalid_post = post.as_json.except("point_id")
      put :create, post: invalid_post
      visit admin_post_path(post)

      expect(response.status).to be(200)
      expect(flash[:error].present?).to be(true)
    end

    it "should create post success with valid field" do
      sign_in
      valid_post = post.as_json
      put :create, post: valid_post
      visit admin_post_path(post)

      expect(response.status).to be(302)
      expect(flash[:notice].present?).to be(true)
    end
  end

  describe ":edit" do
    it "should show edit post page" do
      sign_in
      get :edit, id: post.id
      visit edit_admin_post_path(post)
      expect(response.status).to be(200)
    end
  end

  describe ":update" do
    it "should update post failed with invalid field" do
      sign_in
      invalid_post = post.as_json.merge("point_id" => nil)
      put :update, id: post.id, post: invalid_post
      visit admin_post_path(post)

      expect(response.status).to be(200)
      expect(flash[:error].present?).to be(true)
    end

    it "should update post success with valid field" do
      sign_in
      put :update, id: post.id, post: post.as_json
      visit admin_post_path(post)

      expect(response.status).to be(302)
      expect(flash[:notice].present?).to be(true)
    end
  end

  describe ":destroy" do
    it "should destroy post success" do
      sign_in
      delete :destroy, id: post.id
      visit admin_post_path(post)
      expect(response.status).to be(302)
    end
  end
end
