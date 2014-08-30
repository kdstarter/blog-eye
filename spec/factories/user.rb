
FactoryGirl.define do
  valid_uid = 'uid'
  valid_email = 'valid@example.com'
  valid_password = 'password'
  valid_password_confirmation = 'password'

  invalid_uid = 'www'
  invalid_email = 'invalid'
  invalid_password = 'invalid'
  invalid_password_confirmation = 'repassword'

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
