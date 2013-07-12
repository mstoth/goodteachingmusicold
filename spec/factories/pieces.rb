require 'faker'

FactoryGirl.define do
  factory :piece do
    title { Faker::Name.last_name }
    composer "Bach"
  end
  
  factory :message do
    title { Faker::Name.name }
    composer { Faker::Name.name }
    message { Faker::Lorem.paragraph }
    
    factory :invalid_message do
      title nil
    end
  end
  
end
