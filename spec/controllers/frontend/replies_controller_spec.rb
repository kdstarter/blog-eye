require 'rails_helper'

RSpec.describe Frontend::RepliesController, :type => :controller do
  let(:blogger) { create(:valid_random_user) }
  let(:post) {
    create(:valid_post,
        user: blogger,
        point: build_stubbed(:valid_point),
        category: build_stubbed(:valid_category)
  ) }
  let(:reply) { create(:valid_reply, user: current_user, post: post ) }

  describe ":create" do
    it "should create reply failed with invaild info" do
      sign_in
      invalid_reply = reply.as_json.merge(content: "XXX，想要自&焚吗？")

      put :create, post_id: post.id, reply: invalid_reply
      visit frontend_post_replies_path(post, invalid_reply)

      expect(response.status).to be(302)
      expect(flash[:error].present?).to be(true)
    end

    it "should create reply success with vaild info" do
      sign_in
      valid_reply = reply.as_json

      put :create, post_id: post.id, reply: valid_reply
      visit frontend_post_replies_path(post, valid_reply)

      expect(response.status).to be(302)
      expect(flash[:notice].present?).to be(true)
    end
  end
end
