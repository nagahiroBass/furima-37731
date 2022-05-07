FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { "1a#{Faker::Internet.password(min_length: 4)}" }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    firstname             { '田中' }
    lastname              { '太郎' }
    firstname_read        { 'タナカ' }
    lastname_read         { 'タロウ' }
    birthday              { '20000101' }
  end
end
