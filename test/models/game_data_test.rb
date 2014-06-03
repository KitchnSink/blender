require "test_helper"

class GameDataTest < ActiveSupport::TestCase

  def game_data
    @game_data ||= GameData.new
  end

  def test_valid
    assert game_data.valid?
  end

end
