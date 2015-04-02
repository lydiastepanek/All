require_relative 'piece'
require 'byebug'

class SteppingPiece < Piece

  def stepping_moves
    potential_moves = self.class::DELTAS.map do |dx, dy|
      [dx + @position[0], dy + @position[1]]
    end

    potential_moves = moves_within_bounds(potential_moves)
    potential_moves = unblocked_moves(potential_moves)
  end


end
