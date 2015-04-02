require_relative 'sliding_piece'

class Queen < SlidingPiece

  def initialize(board, position, color)
    super
    @symbol = "Q"
  end

  def specific_moves
    accessible_diagonal_moves(moves_within_bounds(diagonal_moves)) +
    accessible_lateral_moves(moves_within_bounds(lateral_moves))
  end

end
