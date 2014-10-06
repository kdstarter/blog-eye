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

  describe ":profile" do
    it "should show user profile page" do
      sign_in

      get :profile
      visit admin_profile_path
      expect(response.status).to be(200)
    end
  end

  describe ":update_profile" do
    it "should update profile failed with invalid field" do
      sign_in
      user = current_user.as_json.merge(city_name: "S")
      put :update_profile, user: user
      visit admin_update_profile_path

      expect(response.status).to be(200)
      expect(flash[:error].present?).to be(true)
    end

    it "should update profile success with valid field" do
      sign_in
      put :update_profile, user: current_user.as_json
      visit admin_update_profile_path

      expect(response.status).to be(302)
      expect(flash[:notice].present?).to be(true)
    end
  end
end
