require 'spec_helper'

# As a user
# I want to view a list of all available meetups
# So that I can get together with people with similar interests

# Acceptance Criteria
# Meetups should be listed alphabetically.
# Each meetup listed should link me to the show page for that meetup.

feature "User views list of all meetups" do
  scenario "user sees the entire list of meetups" do

    visit "/"

    expect(page).to have_content "Annual Shenanigans Meeting"
    expect(page).to have_link "No Pants Dance-Off"
  end
end
