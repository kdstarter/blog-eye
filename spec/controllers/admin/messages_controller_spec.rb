require 'rails_helper'

RSpec.describe Admin::MessagesController, :type => :controller do
  describe ":index" do
    it "should show messages if user signed in" do
      sign_in

      get :index
      visit admin_root_path
      expect(response.status).to be(200)
    end
  end

end
