require "test_helper"

class Api::Lessons::GetLessonDataTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Hello World"
    refute_content page, "Goobye All!"
  end
end
