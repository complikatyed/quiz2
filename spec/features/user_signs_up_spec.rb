# Following in-class example from Median project

feature "User Signs Up" do

  background do
    visit root_path
    click_on "I'm a new nerd!"
  end

  scenario "Happy Path" do
    page.should_not have_link("I'm a new nerd!")
    fill_in "Choose a username", with: "Bob"
    fill_in "What's your email address?", with: "bob@example.com"
    fill_in "Choose a password", with: "password1"
    fill_in "What was that password again?", with: "password1"
    click_button "Sign me up, coach!"
    page.should have_content("What's the plan, Bob?")
    page.should_not have_content("welcome to QUIZLYTICS a quizbowl point tracking system")
    click_on "I'm done for today."
    page.should have_content("welcome to QUIZLYTICS a quizbowl point tracking system")
    click_on "I'm a returning nerd!"
    fill_in "What's your email address?", with: "bob@example.com"
    fill_in "What's your password?", with: "password1"
    click_button "Let's do this!"
    page.should have_content("What's the plan, Bob?")
  end

  scenario "Error Path" do
    fill_in "Choose a username", with: ""
    fill_in "What's your email address?", with: "jessexample.com"
    fill_in "Choose a password", with: "password1"
    fill_in "What was that password again?", with: "whatevs"
    click_on "Sign me up, coach!"
    page.should have_css(".alert", text: "Please fix the errors below to continue.")

    page.should have_css(".user_name .error", "can't be blank")
    page.should have_css(".user_email .error", "must be an email address")
    page.should have_css(".user_password_confirmation .error", "doesn't match password")

    fill_in "Choose a username", with: "Shriya"
    fill_in "What's your email address?", with: "shriya@example.com"
    fill_in "Choose a password", with: "password1"
    fill_in "What was that password again?", with: "password1"
    click_on "Sign me up, coach!"
    page.should have_content("What's the plan, Shriya?")
  end
end