require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { create(:valid_random_user) }

  describe "function check" do
    it "should return formatted created_at" do
      user.created_at = Time.new(1990, 1, 1)
      expect(user.created_time).to eq("1990-01-01 00:00")
    end

    it "should return human_name" do
      expect(user.human_name.present?).to eq(true)
    end

    it "should return whose_blogger" do
      expect(user.whose_blogger.present?).to eq(true)
    end

    it "should return github_page" do
      expect(user.github_page.include?('//github.com/')).to eq(true)
    end

    it "should return city" do
      expect(user.city.present?).to eq(true)
    end

    it "should return blogger_title" do
      expect(user.blogger_title.present?).to eq(true)
    end

    it "should return avatar_url" do
      expect(user.avatar_url.present?).to eq(true)
    end

    it "should return gravatar_url" do
      expect(user.gravatar_url.present?).to eq(true)
    end
  end
end
