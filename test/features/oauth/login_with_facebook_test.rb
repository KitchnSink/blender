require "test_helper"

feature 'As a site visitor
I want to login with facebook
so that I don\'t have to create a new user account' do

  scenario "user signs in with facebook" do
    # Given a user on the login page
    visit new_user_session_path
    User.where(username: 'test_facebook_user').destroy()
    # configure OmniAuth
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = Devise.mappings[:user]
    OmniAuth.config.add_mock(:facebook, {
                               uid: '12345',
                               info: { nickname: 'test_facebook_user' }
                             })

    # When I click sign in with facebook
    click_on "Sign in with Facebook"
    save_and_open_page

    # I am now signed in
    page.text.must_include "test_facebook_user, you are signed in!"

  end

end
