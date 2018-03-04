class SoccerLeagueBoard
  require 'byebug'

  # Get input file name from user until a valid file name is provided. Find the Soccer Team ranking and display it at console
  # @param [None]
  # @return [Array] The final results which are displayed at console.
  def calculate_soccer_board
    while true
      puts "Please enter input file name:"
      file_name = gets.chomp
      break if File.exist?(file_name)
      puts "ERROR!!! File name #{file_name} is incorrect"
    end
    games = parse_games_input(file_name)
    results = calculate_games_result(games)
    generate_output(results)
  end

  # Read input file and perform ETL to setup data into pre-defined structure.
  # @param file_name [String] from user input on console.
  # @return [Array] the data from input file is converted into the expected format.
  def parse_games_input(file_name)
    games = []
    File.open(file_name, "rb") do |file|
      file.each_line do |line|
        games << line.strip.split(',').map {|entry| [entry.delete(entry.split(' ').last).strip, entry.split(' ').last]}
      end
      games
    end
  end

  # Get games information in a predefined format and calculate the score.
  # In this league, a draw (tie) is worth 1 point and a win is worth 3 points.
  # A loss is worth 0 points. If two or more teams have the same number of points,
  # they should have the same rank and be printed in alphabetical order
  # @param games [Array] games data into predefined format.
  # @return [Hash] the sorted results by number of points
  def calculate_games_result(games)
    results = {}
    games.each do |game|
      if game.first.last > game.last.last
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
    results = results.sort { |(k1, v1), (k2, v2)| [v1, k2] <=> [v2, k1] }.reverse.to_h
    results
  end

  # Get point based results, calculate ranks and display final results at console.
  # @param results [Hash] point based results
  # @return [Array] The final results which are displayed at console.
  def generate_output(results)
    last_score = ''
    final_results = []
    count = 0
    results.each_with_index do |result, index|
      count = last_score == result.last ? count : count + 1
      output = "#{count}. #{result.first}, #{result.last} pt"
      output = [output, 's'].join if result.last != 1
      puts output
      final_results << output
      last_score = result.last
    end
    final_results
  end
end

s = SoccerLeagueBoard.new()
s.calculate_soccer_board
