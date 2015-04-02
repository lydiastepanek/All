require_relative 'piece'

class Pawn < Piece

  def initialize(board, position, color)
    super
    @unmoved = true
    @symbol = "p"
  end

  def specific_moves
    moves = []
    if @color == :black
      moves << [@position[0] + 1, @position[1]]
      two_spaces = [@position[0] + 2, @position[1]]
      moves << two_spaces if @unmoved && unblocked?(two_spaces)
    elsif @color == :white
      moves << [@position[0] - 1, @position[1]]
      two_spaces = [@position[0] - 2, @position[1]]
      moves << two_spaces if @unmoved && unblocked?(two_spaces)
    end
    moves_within_bounds(moves)
    unblocked_moves(moves)
  end

  def toggle_unmoved
    @unmoved = false
  end

  def unblocked?(space)
    @board[*space].nil?
  end

end
