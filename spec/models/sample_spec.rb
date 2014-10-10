require 'rails_helper'

RSpec.describe Sample, model: true do
  it "has a valid factory" do
    sample = FactoryGirl.create(:sample)
    expect(sample).to be_valid
  end
end
