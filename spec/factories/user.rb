FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      name { Faker::Name.name }  
    #   Note: The faker gem has a unique feature in case proper usernames ever come into play. See Faker documentation.
      password { "password" }
      password_confirmation { "password" }
    end
  end 