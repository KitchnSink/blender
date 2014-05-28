require "test_helper"

feature 'As a user
         I want to sign in with my account details
         so that the website allows me to perform the actions of an authenticated user' do
  scenario "user signs in to website and starts to play" do
    # Given I logged into the website
    sign_in 'player@user_test.com'

    # When I visit the homepage
    visit root_path

    # Then the ember app should launch and display the next available lesson

    # get the current user's player object
    player = current_user.load_player
    lesson = Lesson.find(@player.next_available_lesson)

    # add more stuff here for the ember app
    page.text.must_include("#{lesson.title}")

  end
end
