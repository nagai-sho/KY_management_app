FactoryBot.define do
  factory :project do
    name                    { Faker::Company.name } # 工事件名、案件名
    client                  { Faker::Company.name }
    construction_start      { Faker::Date.between(from: 1.years.ago, to: Date.today) } # 着工日
    construction_completion { |n| n.construction_start + rand(30..365).days } # 竣工日
    construction_content    { Faker::Lorem.paragraph(sentence_count: 2) } # 工事内容
  end
end
