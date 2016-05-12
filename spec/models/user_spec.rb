require 'rails_helper'

RSpec.describe User, model: true do
  it "has a valid factory" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it { should have_many(:songs) }
  it { should have_many(:samples) }
  it { should have_many(:comments) }

  it { should have_valid(:name).when("Henry", "Johnny", "Sam") }
  it { should_not have_valid(:name).when(nil, '') }
end
