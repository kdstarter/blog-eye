
FactoryGirl.define do
  factory :valid_message, class: Message do
    code nil
    body '你有新评论'
    is_read false
  end
end
