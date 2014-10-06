require 'rails_helper'

RSpec.describe Frontend::UsersController, :type => :controller do
  let(:blogger) { create(:valid_random_user) }

  describe ":show" do
    it "should show blogger homepage" do
      sign_in nil
      get :show, uid: blogger.id

      visit frontend_path(blogger)
      expect(response.status).to be(200)
    end
  end
end
