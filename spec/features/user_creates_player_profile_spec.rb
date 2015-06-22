feature "user creates player profile" do
  # As a user
  # In order to represent my student players in the game
  # I want to create a player profile.

  # Acceptance Criteria:
  # * Player profile must have name, email, cell-phone, points, and negs.
  # * Player profile must be publicly visible once saved <-- not sure how this should look


  scenario "happy path create player profile" do
    me = Fabricate(:user, name: "Sarah")
    signin_as me
    click_on "I need to create my player profile"
    page.should have_content("First name *")
    page.should have_content("Last name *")
    page.should have_content("Email *")
    page.should have_content("Cell")
    fill_in "First name", with: "Sarah"
    fill_in "Last name", with: "Harrison"
    fill_in "Email", with: "sah@email.com"
    fill_in "Cell", with: "6155551212"
    click_on "I'm ready to play!"
    within("h4") do
      page.should have_content("Sarah H")
    end
    page.should have_content("Email: sah@email.com")
    page.should have_content("Cell: 6155551212")
    page.should have_content("Points: 0")
    page.should have_content("Negs: 0")
  end
end

