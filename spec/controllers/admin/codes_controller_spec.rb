require 'rails_helper'

RSpec.describe Admin::CodesController, :type => :controller do
  let(:code) {
    create(:valid_code,
        user: current_user,
        category: build_stubbed(:valid_category),
        language: build_stubbed(:valid_language)
  ) }

  describe ":index" do
    it "should show all codes" do
      sign_in
      get :index
      visit admin_codes_path
      expect(response.status).to be(200)
    end
  end

  describe ":show" do
    it "should show one code exactly" do
      sign_in
      get :show, id: code.id
      visit admin_code_path(code)
      expect(response.status).to be(200)
    end
  end

  describe ":new" do
    it "should show new code page" do
      sign_in
      get :new
      expect(response.status).to be(200)
    end
  end

  describe ":create" do
    it "should create code failed with invalid field" do
      sign_in
      invalid_code = code.as_json.except("language_id")
      put :create, code: invalid_code
      visit admin_code_path(code)

      expect(response.status).to be(200)
      expect(flash[:error].present?).to be(true)
    end

    it "should create code success with valid field" do
      sign_in
      valid_code = code.as_json
      put :create, code: valid_code
      visit admin_code_path(code)

      expect(response.status).to be(302)
      expect(flash[:notice].present?).to be(true)
    end
  end

  describe ":edit" do
    it "should show edit code page" do
      sign_in
      get :edit, id: code.id
      visit edit_admin_code_path(code)
      expect(response.status).to be(200)
    end
  end

  describe ":update" do
    it "should update code failed with invalid field" do
      sign_in
      invalid_code = code.as_json.merge(language_id: nil)
      put :update, id: code.id, code: invalid_code
      visit admin_code_path(code)

      expect(response.status).to be(200)
      expect(flash[:error].present?).to be(true)
    end

    it "should update code success with valid field" do
      sign_in
      put :update, id: code.id, code: code.as_json
      visit admin_code_path(code)

      expect(response.status).to be(302)
      expect(flash[:notice].present?).to be(true)
    end
  end

  describe ":destroy" do
    it "should destroy code success" do
      sign_in
      delete :destroy, id: code.id
      visit admin_code_path(code)
      expect(response.status).to be(302)
    end
  end
end
