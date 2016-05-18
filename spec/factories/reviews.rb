FactoryGirl.define do
  factory :review do
    description "This is an alright place. The drinks were ok. I wish they had better music and the bathroom wasn't full."
    venue_rating 3

    user
    venue
  end
end
