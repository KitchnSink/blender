require "test_helper"

class ChallengeTest < ActiveSupport::TestCase

  def challenge
    @challenge ||= Challenge.new
  end

  def test_valid
    assert challenge.valid?
  end

end
