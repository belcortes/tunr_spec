FactoryGirl.define do
  factory :artist, class: Artist do
    id 1
    name Faker::Name.name
    url Faker::Internet.url
  end
  factory :artist2, class: Artist do
    id 2
    name Faker::Name.name
    url Faker::Internet.url
  end
  factory :invalid_artist, class: Artist do
    id 3
    name nil
    url nil
  end
end