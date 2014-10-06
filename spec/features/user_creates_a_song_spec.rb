require 'rails_helper'
feature "Authenticated user creates a new song", %Q{
  As an user
  I want to create a song
  so I can group my samples togeva
  }  do

before :each do
end
  context "authenticated user" do
    before (:each) do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
    end

    scenario "User uploads a sample" do
      # sample = FactoryGirl.create(:sample)

      visit new_sample_path

      fill_in "Name", with: "Dope sample"
      fill_in "Length", with: 100
      fill_in "Category", with: "Dope"
      fill_in "Description", with: "This sample right here playboy? This is dope."
      attach_file "Add File", Rails.root.join('uploads/sadtrombone.wav')

      click_on "Submit"

      expect(page).to have_content "Your sample has been accepted."
    end

    scenario "User trys to upload a sample and can't quite get it together" do
      visit new_sample_path

      fill_in "Length", with: 100
      attach_file "Add File", Rails.root.join('uploads/sadtrombone.wav')
      click_on "Submit"

      expect(page).to have_content "Category can't be blank."
      expect(page).to have_content "Description can't be blank."
      expect(page).to have_content "Name can't be blank."
    end

    scenario "User trys to upload a sample but there is no sample" do
      visit new_sample_path

      fill_in "Name", with: "Dope sample"
      fill_in "Length", with: 100
      fill_in "Category", with: "Dope"
      fill_in "Description", with: "This sample right here playboy? This is dope."
      attach_file "Add File", Rails.root.join('uploads/sadtrombone.wav')
      click_on "Submit"

      expect(page).to have_content "You didn't include a file."
    end
  end


  scenario "unauthenticated user cannot create a new sample" do
    visit new_sample_path

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
