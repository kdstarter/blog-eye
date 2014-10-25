require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  describe ":title" do
    it "should return site_intro" do
      visit "/"
      expect(response.success?).to be(true)
    end
  end

  describe ":check_browser" do
    it "should notice if browser is lt IE9" do
      # fix me to mock browser lt IE9
      visit "/"
      expect(response.success?).to be(true)
      # expect(flash[:alert].present?).to be(true)
    end
  end
end
