feature "user creates player profile" do
  # As a user
  # In order to track game play,
  # I want to create a game.

  # Acceptance Criteria:
  # * Game must have id.
  # * Game must have date.
  # * Game must have a minimum of two players.

  background do
    Fabricate(:player, first_name: "Arturo", last_name: "Reyes", email: "AR@reyes.com" , cell: "9013425431")
    Fabricate(:player, first_name: "Tania", last_name: "Denisovich", email: "Talia@yahoo.com" , cell: "4041240098")
    Fabricate(:player, first_name: "Sam", last_name: "Stevens", email: "Sam@sillymail.com" , cell: "4568822309")
    Fabricate(:player, first_name: "Roberta", last_name: "Gilcrest", email: "Bert@smymail.com" , cell: "8003334521")
    Fabricate(:player, first_name: "Nakia", last_name: "Simpson", email: "Nakki@mail.com" , cell: "3454444521")
    visit root_path
  end

  scenario "happy path create game" do
    me = Fabricate(:user, name: "Sarah")
    signin_as me
    click_on "Set up a game"
    page.should have_content("Arturo R")  # These are going to have check boxes
    page.should have_content("Tania D")
    page.should have_content("Sam S")
    page.should have_content("Roberta G")
    page.should have_content("Nakia S")
    #page.should have_link("Add to Game")  <-- how to write spec for checkbox?
    #page.should have_link("Make Captain") <-- to be added as a feature later
    page.should have_link("Let's Play!")





  end
end