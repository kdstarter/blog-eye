require 'rails_helper'

RSpec.describe Reply, :type => :model do
  let(:blogger) { create(:valid_random_user) }
  let(:post) {
    create(:valid_post,
        user: blogger,
        point: build_stubbed(:valid_point),
        category: build_stubbed(:valid_category)
  ) }
  let(:reply) { create(:valid_reply, user: build_stubbed(:valid_user), post: post ) }

  describe "function check" do
    it "should return formatted created_at" do
      reply.created_at = Time.utc(1990, 1, 1)
      expect(reply.published_time).to eq("1990-01-01 08:00")
    end
  end
end
