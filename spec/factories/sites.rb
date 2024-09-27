FactoryBot.define do
  factory :site do
    name        { Faker::Company.name } # 工事現場名
    postal_code { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    address     { Faker::Address.full_address }
  end
end
