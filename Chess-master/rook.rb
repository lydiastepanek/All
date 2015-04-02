require_relative 'sliding_piece'

class Rook < SlidingPiece

  def initialize(board, position, color)
    super
    @symbol = "R"
  end

  def specific_moves
    accessible_lateral_moves(moves_within_bounds(lateral_moves))
  end



end
