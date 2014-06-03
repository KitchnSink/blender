require "test_helper"

class ExperienceTest < ActiveSupport::TestCase

  def experience
    @experience ||= Experience.new
  end

  def test_valid
    assert experience.valid?
  end

end
