require_relative "./player.rb"

class RpsPlayer < Player
  POSSIBLE_MOVES = ["rock", "paper", "scissors"]
  attr_accessor :move_history, :move_counter, :win_count, :loss_count, :tied_count

  def initialize(name, opts = {})
    @move_history = []
    @move_counter = {}
    @win_count = 0
    @loss_count = 0
    @tied_count = 0
    super(name, opts)
  end

  def log_move(move)
    unless POSSIBLE_MOVES.include? move
      raise Exception.new("Unknown Move")
    end
    @move_counter[move] ||= 0
    @move_counter[move] += 1
    @move_history << move
  end

  def print_score
    puts "#{@name} won #{@win_count} times."
    puts "#{@name} lost #{@loss_count} times."
    puts "#{@name} tied #{@tied_count} times."
  end

end
