require 'rails_helper'

describe "When i visit tutorials new path" do
  it "I can fill in the form and save" do

    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_tutorial_path

    fill_in "tutorial[title]", with: 'Best Video Ever'
    fill_in "tutorial[description]", with: 'Wild N Out'
    fill_in "tutorial[thumbnail]", with: 'http://i3.ytimg.com/vi/-eHzgef2GK4/maxresdefault.jpg'

    click_on "Save"
    tutorial = Tutorial.first

    expect(current_path).to eq(tutorial_path(tutorial))

  end

end
