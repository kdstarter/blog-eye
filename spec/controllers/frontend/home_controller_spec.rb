require 'rails_helper'

RSpec.describe Frontend::HomeController, :type => :controller do
  describe ":check_browser" do
    it "should notice if browser is lt IE9" do
      request.env['HTTP_USER_AGENT'] = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0'
      get :index
      expect(response.success?).to be(true)
      expect(flash[:alert].present?).to be(true)
    end
  end

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
