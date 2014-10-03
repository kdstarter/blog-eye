require 'rails_helper'

RSpec.describe Admin::MessagesController, :type => :controller do

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

      # get :show, { id: message.id }
      # visit admin_message_path(message)
      # expect(response.status).to be(200)
    end
  end
end
