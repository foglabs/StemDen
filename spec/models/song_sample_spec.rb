require 'rails_helper'

RSpec.describe SongSample, model: true do
  it "has a valid factory" do
    sample = FactoryGirl.create(:song_sample)
    expect(sample).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:song) }
  it { should belong_to(:sample) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:song) }
  it { should validate_presence_of(:sample) }
end
