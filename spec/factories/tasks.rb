FactoryBot.define do
  FactoryBot.define do
    factory :task do
      title { Faker::Lorem.word }
      body { Faker::Lorem.sentence }
    end
  end
end
