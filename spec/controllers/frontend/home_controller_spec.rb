#encoding: utf-8
require 'rails_helper'

RSpec.describe Frontend::HomeController, :type => :controller do
  describe ":index" do
    it "should show sign_in link if user not signed in" do
      sign_in nil

      get :index
      expect(response.success?).to be(true)

      visit admin_root_path
      # response.should redirect_to(new_user_session_path)
    end

    it "should show sign_out link if user signed in" do
      # sign_in

      get :index
      visit admin_root_path
      expect(response.success?).to be(true)
    end
  end
end
