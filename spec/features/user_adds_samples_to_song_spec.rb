require 'rails_helper'

feature "User adds samples to a song" do

  let(:song) { FactoryGirl.create(:song) }
  let!(:sample) { FactoryGirl.create(:sample) }

  scenario "authenticated user adds samples to a song" do
    sign_in_as(song.user)

    visit song_path(song)
    select sample.name, from: 'Sample'
    click_button 'Add Sample'

    expect(page).to have_content('Sample added')
    within 'ul.samples' do
      expect(page).to have_content(sample.name)
    end
  end

  scenario 'user forgets to select a sample' do
    sign_in_as(song.user)

    visit song_path(song)
    click_button 'Add Sample'

    expect(page).to have_content("Sample can't be blank")
  end

end
