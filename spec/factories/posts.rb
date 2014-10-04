
FactoryGirl.define do
  factory :valid_post, class: Post do
    source 0
    title 'watirwebdriver'
    tags 'rspec, capybara, webdriver'
    content 'All HTML elements are supported by Watir-WebDriver.'
  end
end
