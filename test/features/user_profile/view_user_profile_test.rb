require "test_helper"

feature 'As a student
         want to view my profile
         so that I can view my experience.' do
  scenario "user views profile page" do
    # Given I have signed into my account
    sign_in('chrismontes@about.me')
    visit '/user_profile'

    page.text.must_include "roottag"
  end
end
