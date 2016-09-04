FactoryGirl.define do
  factory :task do
    name { Faker::ChuckNorris.fact }
    status { 'new' }
  end
end
