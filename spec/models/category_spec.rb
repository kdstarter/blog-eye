require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { create(:valid_category, user: build_stubbed(:valid_user)) }

  describe "function check" do
    it "should return formatted created_at" do
      category.created_at = Time.utc(1990, 1, 1)
      expect(category.created_time).to eq("1990-01-01 08:00")
    end
  end
end
