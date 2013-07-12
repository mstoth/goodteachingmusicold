# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.create do
  factory :piece do |p|
    p.title { Faker::Name.title }
    p.composer "Bach"
    p.genre "Baroque"
    p.difficulty "Easy"
    p.instrument "Piano"
  end
end
