require 'rails_helper'

RSpec.describe Frontend::BlogsController, :type => :controller do
  let(:blog) { create(:valid_blog) }

  describe ":index" do
    it "should show all blogs" do
      sign_in nil
      get :index

      visit frontend_blogs_path
      expect(response.status).to be(200)
    end
  end

  describe ":show" do
    it "should show one blog" do
      sign_in nil
      get :show, id: blog.id

      visit frontend_blog_path(blog)
      expect(response.status).to be(200)
    end
  end
end
