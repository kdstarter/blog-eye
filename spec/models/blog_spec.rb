require 'rails_helper'

RSpec.describe Blog, :type => :model do
  let(:blog) { create(:valid_blog) }

  describe "function check" do
    it "should return formatted created_at" do
      blog.created_at = Time.new(1990, 1, 1)
      expect(blog.published_time).to eq("1990-01-01 00:00")
    end

    it "should return text of type" do
      expect(blog.type.present?).to eq(true)
    end
  end
end
