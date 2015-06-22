feature "user creates player profile" do
  # As a user
  # In order to keep my player profile current
  # I want to update my player profile.

  # Acceptance Criteria:
  # * Player must only be able to change name, email, cell-phone.
  # * Player must be publicly visible once saved <-- not sure how this should look


  scenario "happy path update player profile" do
    me = Fabricate(:user, name: "Reggie")
    signin_as me
    click_on "Create a new player profile"
    page.should have_content("First name *")
    page.should have_content("Last name *")
    page.should have_content("Email *")
    page.should have_content("Cell")
    fill_in "First name", with: "Reggie"
    fill_in "Last name", with: "Stevers"
    fill_in "Email", with: "reggie@exampleemail.com"
    fill_in "Cell", with: "6155431115"
    click_on "I'm ready to play!"
    within("h4") do
      page.should have_content("Reggie S")
    end
    page.should have_content("Email: reggie@exampleemail.com")
    page.should have_content("Cell: 6155431115")
    page.should have_content("Points: 0")
    page.should have_content("Negs: 0")
    signout
    signin_as me
    click_on "I need to edit my player profile"
        within("h4") do
      page.should have_content("Reggie S")
    end
    page.should have_content("Email: reggie@exampleemail.com")
    page.should have_content("Cell: 6155431115")
    page.should_not have_content("Points: 0")
    page.should_not have_content("Negs: 0")
    # How is the edit process going to work?
  end
end