FactoryGirl.define do
  factory :user, class: User do
    id 1
    name Faker::Name.name
    email 'belcortes@gmail.com'
  end
end