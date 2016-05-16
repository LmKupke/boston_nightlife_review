require 'rails_helper'

describe User do
  it { should have_valid(:fname).when("Bran", "Hodor") }
  it { should_not have_valid(:fname).when(nil, '') }

  it { should have_valid(:lname).when("Stark", "Hodor") }
  it { should_not have_valid(:lname).when(nil, '') }

  it { should have_valid(:email).when("warthogbran@got.com", "hodor@gmail.com") }
  it { should_not have_valid(:email).when(nil, '', 'warthog', 'warthog@com', 'wartha.com') }


  describe '.fname' do
    it 'returns the first name of the user' do
      fname = create(:user, fname: "Arya").fname


      expect(fname).to eq("Arya")
    end
  end

  describe '.lname' do
    it 'returns the last name of the user' do
      lname = create(:user, lname: "Stark").lname
      expect(lname).to eq("Stark")
    end
  end

  describe '.username' do
    it 'returns the username of the user' do
      user = create(:user, username: "iamnoone")
  	  result = user.username
  	  expect(result).to eq("iamnoone")
    end
  end

  describe '.email' do
    it 'returns the email of the user' do
      user = create(:user, email: "valarmorghulis@gmail.com")
  	  result = user.email
  	  expect(result).to eq("valarmorghulis@gmail.com")
    end
  end

  describe '.password' do
    it 'returns the password of the user' do
      user = create(:user, password: "manyfacedgod")
  	  result = user.password
  	  expect(result).to eq("manyfacedgod")
    end
  end

  # describe'.profpic' do
  #   it 'returns the profpic of the user' do
  #     user = create(:user, profpic: "valarmorghulis@gmail.com")
  # 	  result = user.profpic
  # 	  expect(result).to eq("valarmorghulis@gmail.com")
  #   end
  # end

  describe '.role' do
    context 'user is a member' do
      it 'returns member' do
        user = create(:user)
    	  result = user.role
    	  expect(result).to eq("member")
      end
    end

    context 'user is a admin' do
      it 'returns admin' do
        user = create(:user, role:"admin")
    	  result = user.role
    	  expect(result).to eq("admin")
      end
    end
  end

  describe "#admin?" do
    context 'when user is a member' do
      it 'returns false' do
        user = create(:user)
        expect(user.admin?).to eq(false)
      end
    end

    context "when user is an admin" do
      it 'returns true' do
        user = create(:user, role: "admin")
        expect(user.admin?).to eq(true)
      end
    end
  end

  describe "#fullname" do
    it "returns the fullname of the user" do
      user = create(:user)
      expect(user.fullname).to eq("Jon Snow")
    end
  end
end
