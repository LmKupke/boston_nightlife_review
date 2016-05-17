FactoryGirl.define do
  factory :venue do
    
    vname "Dillion's"
    price 2
    cover true
    streetnumber 955
    streetname "Boylston Street"
    vtype "Bar"
    neighborhood "Back Bay"

    user
  end
end
