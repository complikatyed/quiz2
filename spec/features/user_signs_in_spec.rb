# Modeled on in-class specs from Median project

feature "User signs in" do

  before do
    visit "/"
    click_on "I'm a returning nerd!"
    page.should_not have_link("I'm a returning nerd!")
  end

  scenario "Returning customer signs in" do
    user = Fabricate(:user, name: "Jackson")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Let's do this!"
    page.should have_content("Welcome back, Jackson")
    page.should_not have_content("I'm a returning nerd!")
    page.should_not have_content("I'm a new nerd!")
    page.should have_content("I'm done for today.")
    # Smoke testing Sign Out:
    click_on "I'm done for today."
    page.should have_content("I'm a returning nerd!")
    page.should_not have_content("I'm done for today.")
    page.should_not have_content("Welcome back dude")
    page.should have_content("welcome to QUIZLYTICS a quizbowl point tracking system")
  end

  scenario "Returning user attempts signin with incorrect password" do
    user = Fabricate(:user, name: "Andre")
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Let's do this!"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
    page.should_not have_content("Create your account")
    page.should_not have_content("Password confirmation")
    field_labeled("Email").value.should == user.email
    fill_in "Password", with: "password1"
    click_button "Let's do this!"
    page.should have_content("Welcome back, Andre")
  end

  scenario "User signs in with wrong email" do
    Fabricate(:user, email: "Kimber@example.com", password: "ThisIsAwesome", password_confirmation: "ThisIsAwesome")
    fill_in "Email", with: "jamie@example.com"
    fill_in("Password", with: "ThisIsAwesome")
    click_on "Let's do this!"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
  end

  scenario "User signs in with blanks" do
    click_on "Let's do this!"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
  end
end