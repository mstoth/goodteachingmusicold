# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :piece do
    title "Prelude"
    composer "Bach"
    genre "Baroque"
    difficulty "Easy"
    instrument "Piano"
  end
end
