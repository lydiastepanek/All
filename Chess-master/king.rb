require_relative 'stepping_piece'

class King < SteppingPiece

  def initialize(board, position, color)
    super
    @symbol = "K"
  end

  DELTAS = [
    [-1, -1], [-1, 0], [-1, 1],
    [ 0, -1],          [ 0, 1],
    [ 1, -1], [ 1, 0], [ 1, 1]
  ]

  def specific_moves
    stepping_moves
  end


end
