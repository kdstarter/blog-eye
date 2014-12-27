require 'rails_helper'

RSpec.describe Code, :type => :model do
  let(:code) {
    create(:valid_code,
        user: build_stubbed(:valid_user),
        category: build_stubbed(:valid_category),
        language: build_stubbed(:valid_language)
  ) }

  describe "function check" do
    it "should return formatted created_at" do
      code.created_at = Time.new(1990, 1, 1)
      expect(code.published_time).to eq("1990-01-01 00:00")
    end
  end
end
