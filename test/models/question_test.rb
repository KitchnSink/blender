require "test_helper"

class QuestionTest < ActiveSupport::TestCase

  def question
    @question ||= Question.new
  end

  def test_valid
    assert question.valid?
  end

end
