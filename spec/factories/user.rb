
FactoryGirl.define do
  valid_uid = 'test001'
  valid_email = 'test001@gmail.com'
  valid_password = 'test001'
  valid_password_confirmation = 'test001'

  invalid_uid = 'www'
  invalid_email = 'invalid'
  invalid_password = 'invalid'
  invalid_password_confirmation = 'repassword'

  factory :valid_random_user, class: User do
    sequence(:uid) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password valid_password
    password_confirmation valid_password_confirmation
  end

  # for invalid register
  factory :invalid_uid_user, class: User do
    uid invalid_uid
    email valid_email
    password valid_password
    password_confirmation valid_password_confirmation
  end

  factory :invalid_email_user, class: User do
    uid valid_uid
    email invalid_email
    password valid_password
    password_confirmation valid_password_confirmation
  end

  factory :invalid_password_user, class: User do
    uid valid_uid
    email valid_email
    password invalid_password
    password_confirmation valid_password_confirmation
  end

  factory :invalid_repassword_user, class: User do
    uid valid_uid
    email valid_email
    password valid_password
    password_confirmation invalid_password_confirmation
  end

  # for valid register
  factory :valid_register_user, class: User do
    uid valid_uid
    email valid_email
    password valid_password
    password_confirmation valid_password_confirmation
  end


  # for invalid login
  factory :invalid_uid_login_user, class: User do
    uid invalid_uid
    password valid_password
  end

  factory :invalid_email_login_user, class: User do
    email invalid_email
    password valid_password
  end

  factory :invalid_password_login_user, class: User do
    email valid_email
    password invalid_password
  end

  # for valid login
  factory :valid_uid_login_user, class: User do
    uid valid_uid
    password valid_password
  end

  factory :valid_email_login_user, class: User do
    email valid_email
    password valid_password
  end
end
