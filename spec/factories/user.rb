FactoryBot.define do 
  factory :user do 
    username { Faker::StarWars.character }
    password { "password" }
  end
end