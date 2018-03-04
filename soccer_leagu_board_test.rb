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

  def test_calculate_games_result
    games = @soccer_board.parse_games_input(FILE_NAME)
    results = @soccer_board.calculate_games_result(games)
    assert_equal(results['Lions'], 2)
    assert_equal(results['FC Awesome'], 1)
    assert_equal(results['Snakes'], 1)

    ranks = results.keys
    assert_equal(ranks[0], 'Lions')
    assert_equal(ranks[1], 'FC Awesome')
    assert_equal(ranks[2], 'Snakes')
  end

  private

  def expected_parsed_input
    [[["Lions", "3"], ["Snakes", "3"]], [["Lions", "1"], ["FC Awesome", "1"]]]
  end

end
