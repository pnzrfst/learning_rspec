FactoryBot.define do
  factory :weapon do
    power_step { FFaker::Random.rand(1..10) }
    power_base { FFaker::Random.rand(1..12) }
    name { FFaker::Lorem.word }
    level { FFaker::Random.rand(1..10) }
    description { FFaker::Lorem.word }
  end
end
