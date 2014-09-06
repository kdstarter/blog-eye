
FactoryGirl.define do
  factory :valid_new_post, class: Post do
    title 'watirwebdriver'
    tags 'rspec, capybara, webdriver'
    content 'All HTML elements are supported by Watir-WebDriver.'
  end
end
