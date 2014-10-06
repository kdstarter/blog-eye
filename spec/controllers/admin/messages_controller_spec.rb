require 'rails_helper'

RSpec.describe Admin::MessagesController, :type => :controller do
  let(:blogger) { create(:valid_random_user) }
  let(:post) {
    create(:valid_post,
        user: blogger,
        point: build_stubbed(:valid_point),
        category: build_stubbed(:valid_category)
  ) }
  let(:reply) { create(:valid_reply, user: blogger, post: post ) }

  let(:message) {
    create(:valid_message,
        user: current_user,
        sender: blogger,
        target: reply
  ) }

  describe ":index" do
    it "should show all messages" do
      sign_in
      get :index
      visit admin_messages_path
      expect(response.status).to be(200)
    end
  end

  describe ":show" do
    it "should show one message" do
      sign_in

      get :show, { id: message.id }
      visit admin_message_path(message)
      expect(response.status).to be(302)
    end
  end

  describe ":mark_as_read" do
    it "show mark a message as read success" do
      sign_in
      xhr :get, :mark_as_read, id: message.id
      visit mark_as_read_admin_message_path(message)

      expect(response.status).to be(200)
    end
  end

  describe ":destroy" do
    it "should destroy one message" do
      sign_in

      delete :destroy, id: message.id
      visit admin_message_path(message)
      expect(response.status).to be(302)
    end
  end
end
