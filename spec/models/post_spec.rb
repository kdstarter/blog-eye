require 'rails_helper'

RSpec.describe Post, :type => :model do
  let(:post) {
    create(:valid_post,
        user: build_stubbed(:valid_user),
        point: build_stubbed(:valid_point),
        category: build_stubbed(:valid_category)
  ) }

  describe "function check" do
    it "should return formatted created_at" do
      post.created_at = Time.utc(1990, 1, 1)
      expect(post.published_time).to eq("1990-01-01 08:00")
    end

    it "should return text_for_status" do
      expect(post.text_for_status.present?).to eq(true)
    end
  end
end
