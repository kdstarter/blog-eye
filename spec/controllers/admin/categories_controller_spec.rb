require 'rails_helper'

RSpec.describe Admin::CategoriesController, :type => :controller do

  let(:category) { create(:valid_category, user: build_stubbed(:valid_user)) }

  describe ":index" do
    it "should show all categories" do
      sign_in
      get :index
      visit admin_categories_path
      expect(response.status).to be(200)
    end
  end

  describe ":show" do
    it "should show all posts in category" do
      sign_in
      get :show, id: category.id
      visit admin_category_path(category)
      expect(response.status).to be(200)
    end
  end

  describe ":edit" do
    it "should show edit category page" do
      sign_in
      get :edit, id: category.id
      visit edit_admin_category_path(category)
      expect(response.status).to be(200)
    end
  end

  describe ":update" do
    it "should update category success" do
      sign_in
      put :update, id: category.id, category: { name: "test" }
      visit admin_category_path(category)
      expect(response.status).to be(302)
    end
  end

  describe ":destroy" do
    it "should destroy category success" do
      sign_in
      delete :destroy, id: category.id
      visit admin_category_path(category)
      expect(response.status).to be(200)
    end
  end

  describe ":create" do
    it "should create category failed with invalid field" do
      sign_in
      valid_category = attributes_for(:valid_category).merge("name" => nil)
      xhr :post, :create, category: valid_category
      visit admin_category_path(category)

      expect(response.status).to be(403)
    end

    it "should create category success with valid field" do
      sign_in
      valid_category = attributes_for(:valid_category)
      xhr :post, :create, category: valid_category
      visit admin_category_path(category)

      expect(response.status).to be(204)
      expect(category.errors.present?).to be(false)
    end
  end
end
