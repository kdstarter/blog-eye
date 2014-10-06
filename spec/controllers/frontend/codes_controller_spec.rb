require 'rails_helper'

RSpec.describe Frontend::CodesController, :type => :controller do
  let(:code) {
    create(:valid_code,
        user: current_user,
        category: build_stubbed(:valid_category),
        language: build_stubbed(:valid_language)
  ) }

  describe ":index" do
    it "should show all codes" do
      sign_in nil
      get :index, uid: current_user.id

      visit frontend_codes_path(current_user)
      expect(response.status).to be(200)
    end
  end

  describe ":show" do
    it "should show one code" do
      sign_in nil
      get :show, uid: current_user.id, id: code.id

      visit frontend_code_path(current_user, code)
      expect(response.status).to be(200)
    end
  end
end
