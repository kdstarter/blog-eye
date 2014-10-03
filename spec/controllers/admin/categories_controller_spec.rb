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
    it "should show edit category" do
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

end
