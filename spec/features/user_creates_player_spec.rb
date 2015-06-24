feature "user creates player" do
  # As a user
  # In order to represent my student players in the game
  # I want to create a player profile.

  # Acceptance Criteria:
  # * Player profile must have name, email, cell-phone, points, and negs.
  # * Player profile must be publicly visible once saved <-- not sure how this should look


  scenario "happy path create player" do
    me = Fabricate(:user, name: "Sarah")
    signin_as me
    click_on "Add a new player"
    fill_in "Player's first name", with: "Sarah"
    fill_in "Player's last name", with: "Harrison"
    fill_in "Player's email address", with: "sah@email.com"
    fill_in "Player's cell number - just the ten digits", with: "6155551212"
    click_on "This player is ready!"
    within("h4") do
      page.should have_content("Sarah H")
    end
    page.should have_content("Email: sah@email.com")
    page.should have_content("Cell: 6155551212")
    page.should have_content("Points: 0")
    page.should have_content("Negs: 0")
  end
end

