class Board

  attr_accessor :board

  def initialize(set)
     @board = create_board
     set_board if set
  end

  def [] (*pos)
    x, y = pos
    @board[x][y]
  end

  def []=(*pos, to)
    x, y = pos
    @board[x][y] = to
  end

  def print
    puts render
  end

  def render
    @board.map do |row|
      row.map do |piece|
        if piece.class == Piece
          piece.symbol
        else "  "
        end
      end.join("|")
    end.join("\n")
  end

  def create_board
    @board = Array.new(10) {Array.new(10)}
  end

  def set_board

    0.upto(9) do |x|
      0.upto(9) do |y|
        if ([0,2].include?(x) && y % 2 == 1) ||
          ([1,3].include?(x) && y % 2 == 0)
          @board[x][y] = Piece.new(:black, self, [x,y])
        elsif ([6,8].include?(x) && y % 2 == 1) ||
          ([7,9].include?(x) && y % 2 == 0)
          @board[x][y] = Piece.new(:white, self, [x,y])
        end
      end
    end
  end

  def pieces
    @board.flatten.compact
  end

  def deep_dup
    new_board = Board.new(false)
    pieces.each do |piece|
      new_board[*piece.position] = Piece.new(piece.color, new_board, piece.position.dup)
    end
    new_board
  end

end
