FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    company               { Faker::Company.name }
    name                  { Faker::Name.name }
    name_kana             { 'タナカ　タロウ' }
    # phone_number          { Faker::PhoneNumber.cell_phone }
    phone_number          { '090-1234-5678' }
    position              { Faker::Job.position }
  end
end
