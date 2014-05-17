require "test_helper"

feature "A front page to welcome users" do
  # As a user, I want to see a homepage, so I can introduced to the project
  scenario "Access the welcome page" do
    # Given I access the welcome page
    visit root_path

    # When I search the markup
    # The columns class is used
    page.find('h1').text.must_include "Welcome to Blender."
    page.find('h2').text.must_include "A learning tool for gamers."
    page.must_have_selector(".row .columns")
  end

end
