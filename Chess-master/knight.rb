require_relative 'stepping_piece'

class Knight < SteppingPiece

  def initialize(board, position, color)
    super
    @symbol = "H"
  end

  DELTAS = [
    [1,2], [2,1],
    [2, -1], [1, -2],
    [-1,-2], [-2,-1],
    [-2, 1], [-1, 2]
  ]

  def specific_moves
    stepping_moves
  end

end
