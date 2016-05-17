FactoryGirl.define do
  factory :venue do
    user_id 1
    vname "Dillion's"
    price 2
    cover true
    streetnumber 955
    streetname "Boylston Street"
    vtype "Bar"
    neighborhood "Back Bay"
  end
end
