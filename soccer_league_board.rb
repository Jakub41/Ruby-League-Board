class SoccerLeagueBoard
  # For debug the code
  require "byebug"

  def claculate_soccer_board

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

  def calculate_games_results()

  end

end