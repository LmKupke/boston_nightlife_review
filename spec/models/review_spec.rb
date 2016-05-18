require 'rails_helper'

describe Review do
  # user = create(:user)
  # user1 = create(:user)
  # venue = create(:venue)
  # venue1 = create(:venue)

  it { should have_valid(:user_id).when(1, 2) }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:venue_id).when(1, 2) }
  it { should_not have_valid(:venue_id).when(nil, '') }

  it { should have_valid(:description).when("#{'a' * 60}", "#{'b' * 600}") }
  it { should_not have_valid(:description).when(nil, '', "#{'r' * 20}") }

  it { should have_valid(:venue_rating).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:venue_rating).when(nil, '', 0, 6) }

end
