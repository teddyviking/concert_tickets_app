require 'faker'

FactoryGirl.define do
  factory :concert do
    city {Faker::Address.city}
  end

end
