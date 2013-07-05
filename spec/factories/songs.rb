FactoryGirl.define do
  factory :song, class: Song do
    id 1
    name Faker::Name.name
    artist
  end

end