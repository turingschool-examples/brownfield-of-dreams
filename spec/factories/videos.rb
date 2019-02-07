FactoryBot.define do
  factory :video do
    title { Faker::Pokemon.name }
    description { Faker::SiliconValley.motto }
    video_id { Faker::Crypto.md5 }
    tutorial
    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}
    end
  end
end
