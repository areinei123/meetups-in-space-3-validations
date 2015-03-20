require 'spec_helper'
# As a user
# I want to create a meetup
# So that I can gather a group of people to discuss a given topic

# Acceptance Criteria:
#
# I must be signed in.
# I must supply a name.
# I must supply a location.
# I must supply a description.
# I should be brought to the details page for the meetup after I create it.
# I should see a message that lets me know that I have created a meetup successfully.

# User id: 1, provider: "Boston Security Group", uid: "234545", username: "fredchaps", email: "fredders@thisemail.com"

feature "User must be signed in" do
  scenario "User must be stopped from creating a meetup if they arent signed in" do
    visit '/meetups'
    click_on 'Make a Meetup'

    expect(page).to have_content('You need to sign in if you want to do that!')
  end
end

feature "Add a meetup" do

  scenario  "User must supply a name, a location, and a description in the form" do
    user = User.create(provider:"github", uid: 576836, email:"someemail@somemail.com", username:"bruce", avatar_url:"https://some_img.com")
    set_current_user(user)
    visit '/meetups'
    click_link "Sign in"
    click_on 'Add Event'

    fill_in 'name', with:'Laser Tag Championships'
    fill_in 'location', with:''
    fill_in 'description', with:'Want to prove how much of a badass you are?! Come compete in THE LASERDOME'
    click_on 'Add Event'

    expect(page).to have_content('Location can\'t be blank')
  end

  scenario "User wants to view the list of events after creating an event" do
    visit '/create_meetup'
    fill_in 'name', with:'Laser Tag Championships'
    fill_in 'location', with:'The LaserDome'
    fill_in 'description', with:'Want to prove how much of a badass you are?! Come compete in THE LASERDOME'
    click_on 'Add Event'

    expect(page).to have_content('The LaserDome')
    expect(page).to have_link('Laser Tag Championships')
  end

  scenario "User wants to see visual confirmation of successfully creating the event" do
    visit '/create_meetup'
    fill_in 'name', with:'Ship It Saturday'
    fill_in 'location', with:'Launch Academy'
    fill_in 'description', with:'Want to prove how much of a badass you are?! Create an app at Launch Academy!'
    click_on 'Add Event'

    expect(page).to have_content('You have added an event')
  end
end
