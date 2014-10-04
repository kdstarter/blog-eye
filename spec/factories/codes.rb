
FactoryGirl.define do
  factory :valid_code, class: Code do
    source 0
    title 'one code one day'
    tags 'code, every day'
    content 'We should coding every day.'
  end
end
