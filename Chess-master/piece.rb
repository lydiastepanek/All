class Piece

  attr_reader :symbol, :color
  attr_accessor :position, :board

  def initialize(board, position, color)
    @board    = board
    @position = position
    @color    = color
  end

  def moves
    valid_moves(specific_moves)
  end

  def moves_within_bounds(moves)
    moves.select {|x, y| x.between?(0,7) && y.between?(0,7) }
  end

  def unblocked_moves(moves)
    # debugger
    moves.reject do |x, y|
      !@board[x, y].nil? && @board[x, y].color == self.color
    end
  end

  def valid_moves(specific_moves)
    valid_moves = []

    specific_moves.each do |spec_move|
      test_board = @board.deep_dup
      test_board.move!(@position, spec_move)
      valid_moves << spec_move unless test_board.in_check?(self.color)
    end
    valid_moves
  end

end
