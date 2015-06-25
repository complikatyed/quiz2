feature "user views player list" do
  # As a user
  # In order to identify my players
  # I want to view a list of all players.

  # Acceptance Criteria:
  # * All players must be visible.
  # * Each player name must be a link (for editing purposes).

  background do
    Fabricate(:player, first_name: "Arturo", last_name: "Reyes", email: "AR@reyes.com" , cell: "9013425431")
    Fabricate(:player, first_name: "Tania", last_name: "Denisovich", email: "Talia@yahoo.com" , cell: "4041240098")
    Fabricate(:player, first_name: "Sam", last_name: "Stevens", email: "Sam@sillymail.com" , cell: "4568822309")
    visit root_path
  end

  scenario "happy path view player list" do
    visit "/"
    click_on "I'm a new nerd!"
    page.should_not have_link("I'm a new nerd!")
    fill_in "Choose a username", with: "Bob"
    fill_in "What's your email address?", with: "bob@example.com"
    fill_in "Choose a password", with: "password1"
    fill_in "What was that password again?", with: "password1"
    click_button "Sign me up, coach!"
    page.should have_content("What's the plan, Bob?")
    click_on "View players"
    page.should have_content("Arturo R")
    page.should have_content("Tania D")
    page.should have_content("Sam S")
    page.should have_content("AR@reyes.com")
    page.should have_content("Talia@yahoo.com")
    page.should have_content("Sam@sillymail.com")
    page.should have_content("9013425431")
    page.should have_content("4041240098")
    page.should have_content("4568822309")
    page.should have_link("Edit")
    page.should have_link("Remove")
    page.should have_link("Add a new player")
    page.should have_link("Return to options page")
  end
end