require_relative 'sliding_piece'

class Bishop < SlidingPiece

  def initialize(board, position, color)
    super
    @symbol = "B"
  end

  def specific_moves
    accessible_diagonal_moves(moves_within_bounds(diagonal_moves))
  end

end
