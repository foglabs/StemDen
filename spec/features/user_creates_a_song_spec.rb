require 'rails_helper'

feature "Authenticated user creates a new song", %Q{
  As an user
  I want to create a song
  so I can group my samples togeva
  }  do

before :each do
  context "authenticated user" do
    before (:each) do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
    end

    scenario "User creates a new song" do
      samples = FactoryGirl.create_list(:sample, 10)

      visit new_song_path

      fill_in "Name", with: "Fog's Dope Song"
      fill_in "Description", with: "These beats are DOPE."

      samples.each do |sample|
        check sample
      end

      click_on "Submit"

      expect(page).to have_content "Your song has been created."
    end

    scenario "User trys to create a song but doesn't check anything" do
      visit new_song_path
      fill_in "Name", with: "Fog's Dope Song"
      fill_in "Description", with: "These beats are DOPE."

      click_on "Submit"
    end

    scenario "User trys to create a song but doesn't include all the fields" do
      visit new_song_path

      fill_in "Description", with: "These beats are DOPE."

      samples.each do |sample|
        check sample
      end

      click_on "Submit"

      expect(page).to have_content "Name can't be blank."
    end
  end

  scenario "unauthenticated user cannot create a new sample" do
    visit new_sample_path

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
end

