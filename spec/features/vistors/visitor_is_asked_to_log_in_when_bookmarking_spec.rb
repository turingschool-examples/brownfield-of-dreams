require 'rails_helper'

describe 'visitor visits video show page' do
  it 'clicks on the bookmark page and is sent to the log in page' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)

    visit tutorial_path(tutorial)
    expect(page).to_not have_content('User must login to bookmark videos')

    click_link 'Bookmark'
    expect(current_path).to eq(tutorial_path(tutorial))
    expect(page).to have_content('User must login to bookmark videos')
  end
end
