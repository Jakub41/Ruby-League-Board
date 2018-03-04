require_relative 'soccer_league_board'
require 'test/unit'
require 'byebug'

class TestSoccerLeagueBoard < Test::Unit::TestCase

  FILE_NAME = 'sample_input_test.txt'

  def setup
    @soccer_board = SoccerLeagueBoard.new
  end

  def test_parse_games_input
    games = @soccer_board.parse_games_input(FILE_NAME)
    assert_equal(games, expected_parsed_input)
  end

  private

  def expected_parsed_input
    [[["Lions", "3"], ["Snakes", "3"]], [["Lions", "1"], ["FC Awesome", "1"]]]
  end

end
