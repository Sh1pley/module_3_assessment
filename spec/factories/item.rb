FactoryGirl.define do
  factory :item do
    name        {Faker::Superhero.power}
    description {Faker::Superhero.name}
    image_url   {"http://lorempixel.com/400/200"}
  end
end