require 'rails_helper'
feature "Authenticated user adds a new sample", %Q{
  As an user
  I want to post a sample
  so I can shares it on the webs
  }  do

  context "authenticated user" do
    before (:each) do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
    end

    scenario "User uploads a sample" do

      sample = FactoryGirl.create(:sample)
      visit new_sample_path

      click_on "Submit"
      expect(page).to have_content "Your sample has been accepted."
    end
  end


  scenario "unauthenticated user cannot create a matchup" do
    visit new_sample_path

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
