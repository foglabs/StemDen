require 'rails_helper'

RSpec.describe Song, model: true do
  it "has a valid factory" do
    song = FactoryGirl.create(:song)
    expect(song).to be_valid
  end

  it { should have_many(:song_samples)}
  it { should have_many(:samples)}
  it { should belong_to(:user)}
  it {should have_valid(:name).when("Obelisk", "Port", "Rowboat")}
  it {should_not have_valid(:name).when(nil, "")}

end
