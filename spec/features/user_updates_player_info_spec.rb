feature "user updates player info" do
  # As a user
  # In order to keep my player profile current
  # I want to update my player profile.

  # Acceptance Criteria:
  # * Player must only be able to change name, email, cell-phone.
  # * Player must be publicly visible once saved <-- not sure how this should look


  scenario "happy path update player info" do
    me = Fabricate(:user, name: "Reggie")
    signin_as me
    click_on "Add a new player"
    fill_in "Player's first name", with: "Reggie"
    fill_in "Player's last name", with: "Stevers"
    fill_in "Player's email address", with: "reggie@exampleemail.com"
    fill_in "Player's cell number - just the ten digits", with: "6155431115"
    click_on "Player Ready"
    within("h2") do
      page.should have_content("Reggie S")
    end
    page.should have_content("reggie@exampleemail.com")
    page.should have_content("6155431115")
    page.should have_content("Points: 0")
    page.should have_content("Negs: 0")
    signout
    signin_as me
    click_on "View players"
    page.should have_content("Reggie S")
    page.should have_content("reggie@exampleemail.com")
    page.should have_content("6155431115")
    page.should_not have_content("Points: 0")
    page.should_not have_content("Negs: 0")
    # How is the edit process going to work?
  end
end