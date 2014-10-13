require 'rails_helper'

RSpec.describe Comment, model: true do
  it "has a valid factory" do
    comment = FactoryGirl.create(:comment)
    expect(comment).to be_valid
  end

  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should have_valid(:body).when("Obelisk", "Port", "Rowboat") }
  it { should_not have_valid(:body).when(nil, "") }
end
