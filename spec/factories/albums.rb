FactoryGirl.define do
  factory :album do
    id 1
    name Faker::Name.name
    img_url Faker::Internet.url
  end
end