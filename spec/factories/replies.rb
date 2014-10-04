
FactoryGirl.define do
  factory :valid_reply, class: Reply do
    content 'Nice, good post!'
    is_public true
  end
end
