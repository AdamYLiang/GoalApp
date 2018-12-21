# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

  describe "uniqueness" do
    # before :each do
    #   create(:user)
    # end
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "is_password?" do
    # let!(:user) { create(:user) }

    it 'returns true when valid password' do
      expect(user.is_password?("password")).to eq true
    end 

    it 'returns false when invalid password' do
      expect(user.is_password?("notpassword")).to eq false
    end 
  end

  describe "find_by_credentials?" do
    let!(:user) {  }
  end

  describe "reset_session_token!" do
    it 'blahblah'
  end


end
