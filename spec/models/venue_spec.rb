require 'rails_helper'

describe Venue do
  it { should have_valid(:user_id).when(1, 2) }
  it { should_not have_valid(:user_id).when(nil) }

  it { should have_valid(:vname).when("Dillion's", "T's Pub") }
  it { should_not have_valid(:vname).when(nil, '') }

  it { should have_valid(:price).when(1, 2, 3) }
  it { should_not have_valid(:price).when(nil, '', 0, 4) }

  it { should have_valid(:cover).when(true) }
  it { should_not have_valid(:cover).when(nil, '') }

  it { should have_valid(:streetnumber).when(1,1000) }
  it { should_not have_valid(:streetnumber).when(nil, -1, 1.33, 0) }

  it { should have_valid(:streetname).when("Boylston Street", "Newbury Street") }
  it { should_not have_valid(:streetname).when(nil, '3 Boylston Street', '') }

  it { should have_valid(:vtype).when("Bar", "Club") }
  it { should_not have_valid(:vtype).when(nil, 'pub', '', 'club') }

  it { should have_valid(:neighborhood).when("Allston", "Brighton", "Back Bay") }
  it { should_not have_valid(:neighborhood).when(nil, 'Westeros', '', 'Austin') }

  describe '#address' do
    it 'returns a string of the address' do
      venue = create(:venue)
      binding.pry
      expect(venue.address).to eq("955 Boylston Street")
    end
  end
end
