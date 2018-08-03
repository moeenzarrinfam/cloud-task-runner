FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@test.com" }
    password '123456aA'
    confirmed_at Time.zone.now
  end
end