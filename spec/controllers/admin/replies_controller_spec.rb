require 'rails_helper'

RSpec.describe Admin::RepliesController, :type => :controller do
  let(:user) { create(:valid_random_user) }
  let(:post) {
    create(:valid_post,
        user: User.find_by(email: attributes_for(:valid_user)[:email]),
        point: build_stubbed(:valid_point),
        category: build_stubbed(:valid_category)
  ) }
  let(:reply) { create(:valid_reply, user: user, post: post ) }

  describe ":index" do
    it "should show all replies" do
      sign_in
      get :index
      visit admin_replies_path
      expect(response.status).to be(200)
    end
  end

  describe ":destroy" do
    it "should destroy reply success" do
      sign_in
      delete :destroy, id: reply.id
      visit admin_reply_path(reply)

      expect(response.status).to be(200)
      expect(flash[:notice].present?).to be(true)
    end
  end

  describe ":hide" do
    it "show hide reply success" do
      sign_in
      # get :hide, id: reply.id
      # visit hide_admin_reply_path(reply)

      # expect(response.status).to be(200)
      # expect(flash[:notice].present?).to be(true)
    end
  end
end
