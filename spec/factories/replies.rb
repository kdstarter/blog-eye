
FactoryGirl.define do
  factory :valid_reply, class: Reply do
    content 'Hi, @teddy nice, good post!'
    is_public true
  end
end
