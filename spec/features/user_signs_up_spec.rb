# Following in-class example from Median project

feature "User Signs Up" do

  background do
    visit root_path
    click_on "I'm a new nerd!"
  end

  scenario "Happy Path" do
    page.should_not have_link("I'm a new nerd!")
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign me up, coach!"
    page.should have_content("What's the plan, Bob?")
    page.should_not have_content("welcome to QUIZLYTICS a quizbowl point tracking system")
    click_on "I'm done for today."
    page.should have_content("welcome to QUIZLYTICS a quizbowl point tracking system")
    click_on "I'm a returning nerd!"
    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "password1"
    click_button "Let's do this!"
    page.should have_content("What's the plan, Bob?")
  end

  scenario "Error Path" do
    fill_in "Name", with: ""
    fill_in "Email", with: "jessexample.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "whatevs"
    click_on "Sign me up, coach!"
    page.should have_css(".alert", text: "Please fix the errors below to continue.")

    page.should have_css(".user_name .error", text: "can't be blank")
    page.should have_css(".user_email .error", text: "must be an email address")
    page.should have_css(".user_password_confirmation .error", text: "doesn't match Password")

    fill_in "Name", with: "Shriya"
    fill_in "Email", with: "shriya@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign me up, coach!"
    page.should have_content("What's the plan, Shriya?")
  end
end