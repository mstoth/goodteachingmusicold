require 'faker'

FactoryGirl.define do
  factory :piece do |p|
    p.title { Faker::Name.last_name }
    p.composer "Bach"
  end
  
#   factory :message do |m|
#     title { Faker::Name.name }
#     composer { Faker::Name.name }
#     message { Faker::Lorem.paragraph }
    
#     factory :invalid_message do
#       title nil
#     end
#   end
  
end
