FactoryGirl.define do
  factory :user do
    fname "Jon"
    lname "Snow"
    sequence(:username)  { |n| "lordcommander#{n}" }
    sequence(:email) { |n| "knightswatch#{n}@wall.com" }
    password "direwolfGhost"
    password_confirmation "direwolfGhost"

  end
end
