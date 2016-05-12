require 'rails_helper'
feature "Authenticated user adds a new sample", %Q{
  As an user
  I want to post a sample
  so I can shares it on the webs
  }  do

  context "authenticated user" do

    scenario "User uploads a sample" do
      user = FactoryGirl.create(:user)
      sample = FactoryGirl.create(:sample)
      sign_in_as(user)

      visit new_sample_path

      fill_in "Name", with: "Dope sample"
      fill_in "Length", with: 100
      fill_in "Category", with: "Dope"
      fill_in "Description", with: "This sample right here playboy? This is dope."
      attach_file "Add File", Rails.root.join('spec/testfile/sadtrombone.mp3')

      click_on "Submit"

      expect(page).to have_content "Your sample has been accepted."
    end

    scenario "User trys to upload a sample and can't quite get it together" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      visit new_sample_path

      fill_in "Length", with: 100
      attach_file "Add File", Rails.root.join('spec/testfile/sadtrombone.mp3')
      click_on "Submit"

      expect(page).to have_content "Category can't be blank"
      expect(page).to have_content "Name can't be blank"
    end

    scenario "User trys to upload a sample but there is no sample" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      visit new_sample_path

      fill_in "Name", with: "Dope sample"
      fill_in "Length", with: 100
      fill_in "Category", with: "Dope"
      fill_in "Description", with: "This sample right here playboy? This is dope."
      click_on "Submit"

      expect(page).to have_content "You didn't include a file."
      # expect(page).to have_content "Your sample could not be accepted!"
    end
  end


  scenario "unauthenticated user cannot create a new sample" do
    user = FactoryGirl.create(:user)

    visit new_sample_path

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
