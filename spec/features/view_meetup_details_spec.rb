require 'spec_helper'
# As a user
# I want to view the details of a meetup
# So that I can learn more about its purpose

# Acceptance criteria
#I should see the name of the meetup.
#I should see a description of the meetup.
#I should see where the meetup is located.

feature "User views index page" do
  scenario "user sees the name of the meetup" do

    visit "/"

    expect(page).to have_content "Annual Shenanigans Meeting"
  end
end

feature "User views a description of the meetup" do
  scenario "user sees the description of the meetup" do

    visit "/"

    expect(page).to have_content "Its a meeting for super shenanigans!"
  end
end

feature "User views a location of the meetup" do
  scenario "user sees the location of the meetup" do

    visit "/"

    expect(page).to have_content "Dark Side of the Moon"
  end
end

# feature "User can search by location and time" do
#
# end
