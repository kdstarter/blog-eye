
FactoryGirl.define do
  factory :message, class: Message do
    body '你有新评论'
    is_read false
  end
end
