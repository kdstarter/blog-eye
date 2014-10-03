require 'rails_helper'

RSpec.describe Frontend::HomeController, :type => :controller do
  describe ":index" do
    it "should show index page if user not signed in" do
      sign_in nil

      get :index
      visit "/"
      expect(response.status).to be(200)
    end

    it "should also show index page if user signed in" do
      sign_in

      get :index
      visit "/"
      expect(response.status).to be(200)
    end
  end
end
