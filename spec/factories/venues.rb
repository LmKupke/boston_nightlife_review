FactoryGirl.define do
  factory :venue do

    sequence(:vname) { |n| "Dillion's#{n}" }
    price 2
    cover true
    streetnumber 955
    streetname "Boylston Street"
    vtype "Bar"
    neighborhood "Back Bay"

    user
  end
end
