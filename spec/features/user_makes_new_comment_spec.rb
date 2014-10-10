require 'rails_helper'
feature "Authenticated user adds a new comment", %Q{
  As an user
  I want to comment on a sample
  so I can get my discussion on propah
  }  do

before :each do
end
  context "authenticated user" do
    before (:each) do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
    end

    scenario "User adds a comment" do
      sample = FactoryGirl.create(:sample)

      visit samples_path
      click_on "SampleSoGood"

      fill_in "Comment", with: "I have a great deal of things to say!"
      click_on "Submit"

      expect(page).to have_content "Your comment has been accepted."
    end

    scenario "User fills out comment form incorrectly" do
      sample = FactoryGirl.create(:sample)

      visit samples_path
      click_on "SampleSoGood"

      click_on "Submit"

      expect(page).to have_content "Body can't be blank"
    end
  end


  scenario "unauthenticated user cannot create a new sample" do
    visit new_sample_path

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
