feature "user creates team" do
  # As a user
  # In order to collect information about team play
  # I want to create a team.

  # Acceptance Criteria:
  # * Team must have name.

  scenario "happy path create team" do
    me = Fabricate(:user, name: "Sarah")
    signin_as me
    # click_on "Create teams"
    # page.should have_content("Team Name *")
    # fill_in "Team Name", with: "HFA A"
    # click_on "I'm ready to play!"
    # within("h4") do
    #   page.should have_content("HFA A")
    # end
  end
end
