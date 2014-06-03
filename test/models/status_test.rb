require "test_helper"

class StatusTest < ActiveSupport::TestCase

  def status
    @status ||= Status.new
  end

  def test_valid
    assert status.valid?
  end

end
