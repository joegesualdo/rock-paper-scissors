# autoload :Game, "./game.rb"
# autoload :RpsPlayer, "./rps_player.rb"
require_relative "./game.rb"
require_relative "./rps_player.rb"
require_relative "../modules/rps.rb"

class RpsGame < Game
  STRATEGIES = ["favorite", "last_move"]

  attr_reader :strategy 

  def initialize(strategy, player)
    unless STRATEGIES.include? strategy
      raise Exception.new("Unknown Stategy")
    end

    super(player)

    @computer = RpsPlayer.new("CP-3PO")
    @strategy = strategy

    if(strategy == "favorite")
      self.extend(Rps::Strategies::Favorite)
    elsif(strategy == "last_move")
      self.extend(Rps::Strategies::LastMove)
    end
  end

  def make_move(move)
    unless move
      raise Exception.new("Must Provide Move")
    end
    computers_move = calculate_best_move
    @computer.log_move(computers_move)
    @player.log_move(move)
    if move == computers_move
      @player.tied_count += 1
      puts "I chose #{computers_move}, we tied!"
    elsif Rps::WINNING_COUNTER_MOVES[move] == computers_move
      @computer.win_count += 1
      @player.loss_count += 1
      puts "I chose #{computers_move}, I win!"
    else
      @player.win_count += 1
      @computer.loss_count += 1
      puts "I chose #{computers_move}, you win!"
    end
    @player.print_score
  end

  def print_score
    puts "#{@player.name}: #{@player.score}"
    puts "#{@computer.name}: #{@computer.score}"
  end

end
