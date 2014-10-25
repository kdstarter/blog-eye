require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  it "should get site_intro" do
    expect(helper.site_intro.present?).to be(true)
  end

  it "should get site_fullname" do
    expect(helper.site_fullname.present?).to be(true)
  end

  it "should get default_title" do
    expect(helper.default_title.present?).to be(true)
  end

  it "should get errors_message" do
    post = Post.create
    expect(helper.draw_errors_message(post).present?).to be(true)
  end

  it "should get post_tags_from_str" do
    expect(helper.post_tags_from_str("ruby, meta program").present?).to be(true)
  end

  it "should get code_tags_from_str" do
    expect(helper.code_tags_from_str("ruby, meta program").present?).to be(true)
  end
end
