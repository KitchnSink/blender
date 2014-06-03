require "test_helper"

class LessonTest < ActiveSupport::TestCase

  def lesson
    @lesson ||= Lesson.new
  end

  def test_valid
    assert lesson.valid?
  end

end
