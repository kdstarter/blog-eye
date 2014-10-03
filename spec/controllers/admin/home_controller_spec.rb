require 'rails_helper'

RSpec.describe Admin::HomeController, :type => :controller do
  describe ":index" do
    it "should show sign_in link if user not signed in" do
      sign_in nil

      get :index
      visit admin_root_path
      expect(response.status).to be(302)
    end

    it "should show sign_out link if user signed in" do
      sign_in

      get :index
      visit admin_root_path
      expect(response.status).to be(200)
    end
  end
end
