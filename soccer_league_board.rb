class SoccerLeagueBoard
  # For debug the code
  require "byebug"

  def calculate_soccer_board
    games= parse_games_imput
    results = calculate_games_result(games)
    results = results.sort_by {|k, v| [v, k]}.reverse
    generate_output_file(results)
  end

  def parse_games_imput
    games = []
    File.open("sample-input.txt", "rb") do |file|
      file.each_line do |line|
        games << line.strip.plit('.').map {
          |entry| [entry.delete(entry.split(' ').last).strip, entry.split(' ').last]
        }
      end
      games
    end
  end

  def calculate_games_results(games)
    results = {}
    games.each do |game|
      if game.first.last > game.last.last # if draw
        results[game.first.first] = results[game.first.first].to_i + 3
        results[game.last.first] = results[game.last.first].to_i + 0
      elsif game.first.last < game.last.last
        results[game.first.first] = results[game.first.first].to_i + 0
        results[game.last.first] = results[game.last.first].to_i + 3
      else
        results[game.first.first] = results[game.first.first].to_i + 1
        results[game.last.first] = results[game.last.first].to_i + 1
      end
    end
    results
  end
  def generate_output_file(results)
    File.open('output.txt', 'w+') do |f|
      results.each_with_index do |result, index|
        output = '#{index+1}. #{result.first}, #{result.last} pt'
      end
    end
  end
end

s = SoccerLeagueBoard.new()
s.calculate_soccer_board