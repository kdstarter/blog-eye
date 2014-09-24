
FactoryGirl.define do
  factory :valid_random_category, class: Category do
    name 'Java'
    sequence(:description) { |n| "description of category#{n}" }
  end

  factory :valid_category, class: Category do
    name 'Ruby'
    description 'A Script Language'
  end
end