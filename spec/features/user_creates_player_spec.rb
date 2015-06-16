# feature "user creates player profile" do
#   # As a user
#   # In order to represent my student players in the game
#   # I want to create a player.

#   # Acceptance Criteria:
#   # * Player must have name, email, cell-phone.
#   # * Player must be publicly visible once saved <-- not sure how this should look

#   scenario "logged out users can't create players" do
#     visit home_path
#     page.should_not have_content("create my player profile")
#     visit new_player_path
#     should_be_denied_access
#   end

#   scenario "happy path create player profile" do
#     me = Fabricate(:user, name: "Sarah")
#     signin_as me
#     click_on "create my player profile"
#     fill_in "First Name", with: "Sarah"
#     fill_in "Last Name", with: "Harrison"
#     fill_in "Email", with: "sah@email.com"
#     fill_in "Cell", with: "615-555-1212"
#     click_on "save my profile"
#     page.should have_notice("Your player profile has been saved.")
#     current_path.should == player_path/index
#     page.should have_link "Sarah H"
#     click_on "Sarah H"
    
#     page.should have_css("h4", text: "Sarah Harrison")
#     page.should have_css("p", text: "sah@email.com")
#     page.should have_css("p", text: "615-555-1212")
#   end

