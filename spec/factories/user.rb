FactoryBot.define do
  factory :user do
    nickname {"ジョン"}
    last_name {"阿いウ"}
    first_name {"江おカ"}
    last_name_kana{"アイウ"}
    first_name_kana{"エオカ"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday {2019/11/11}
  end
end