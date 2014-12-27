require 'rails_helper'

RSpec.describe Message, :type => :model do
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
        user: build_stubbed(:valid_user),
        sender: blogger,
        target: reply
  ) }

  describe "function check" do
    it "should return formatted created_at" do
      message.created_at = Time.new(1990, 1, 1)
      expect(message.created_time).to eq("1990-01-01 00:00")
    end
  end
end
