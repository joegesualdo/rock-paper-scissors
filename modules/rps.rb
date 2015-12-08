module Rps
  ROCK = "rock"
  PAPER = "paper"
  SCISSORS = "scissors"

  POSSIBLE_MOVES = [ROCK, PAPER, SCISSORS]

  WINNING_COUNTER_MOVES = {}
  WINNING_COUNTER_MOVES[ROCK] = PAPER
  WINNING_COUNTER_MOVES[PAPER] = SCISSORS 
  WINNING_COUNTER_MOVES[SCISSORS] = ROCK 

  module Strategies
    module Favorite
      def calculate_best_move
        if self.player.move_counter.empty?
          # if this is the first move, then make a random move
          favorite_move = POSSIBLE_MOVES.sample
        elsif
          favorite_move = self.player.move_counter.max_by{|k,v| v}[0]
        end
        next_move = case favorite_move
          when ROCK then PAPER 
          when PAPER then SCISSORS 
          when SCISSORS then ROCK 
        end
        next_move
      end
    end
    module LastMove
      def calculate_best_move
        move_history = self.player.move_history
        if move_history.empty?
          last_move = POSSIBLE_MOVES.sample
        elsif 
          last_move = move_history[move_history.length - 1]
        end
        WINNING_COUNTER_MOVES[last_move]
      end
    end
  end
end
