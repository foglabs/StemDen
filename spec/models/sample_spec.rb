require 'rails_helper'

RSpec.describe Sample, model: true do
  it "has a valid factory" do
    sample = FactoryGirl.create(:sample)
    expect(sample).to be_valid
  end

  it { should belong_to(:user) }
  it { should have_many(:songs) }
  it { should have_many(:song_samples) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:user) }
  it { should have_valid(:name).when("Obelisk", "Port", "Rowboat") }
  it { should_not have_valid(:name).when(nil, "") }
end
