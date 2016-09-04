FactoryGirl.define do
  factory :project do
    name { Faker::Educator.course }
  end
end
