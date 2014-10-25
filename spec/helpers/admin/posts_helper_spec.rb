require 'rails_helper'

RSpec.describe Admin::PostsHelper, :type => :helper do
  it "should get sources collection of post" do
    expect(helper.sources_collection.present?).to be(true)
  end
end
