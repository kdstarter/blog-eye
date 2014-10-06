
FactoryGirl.define do
  factory :valid_blog, class: Blog do
    status 1
    category 0
    title 'New feature!'
    content 'New feature is released!'
  end
end
