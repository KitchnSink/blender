require "test_helper"

class SectionTest < ActiveSupport::TestCase

  def section
    @section ||= Section.new
  end

  def test_valid
    assert section.valid?
  end

end
