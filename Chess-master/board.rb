require_relative 'piece'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'

require 'byebug'

class Board

  def initialize(blank = false)
    create_blank_board
    set_board unless blank
  end

  def set_board
    0.upto(7) do |i|
      @board[1][i] = Pawn.new(self, [1, i], :black)
      @board[6][i] = Pawn.new(self, [6, i], :white)
    end

    @board[0][0] = Rook.new(self, [0,0], :black)
    @board[0][7] = Rook.new(self, [0,7], :black)
    @board[0][1] = Knight.new(self, [0,1], :black)
    @board[0][6] = Knight.new(self, [0,6], :black)
    @board[0][2] = Bishop.new(self, [0,2], :black)
    @board[0][5] = Bishop.new(self, [0,5], :black)
    @board[0][3] = Queen.new(self, [0,3], :black)
    @board[0][4] = King.new(self, [0,4], :black)


    @board[3][7] = Queen.new(self, [3,7], :white)

    @board[7][0] = Rook.new(self, [7,0], :white)
    @board[7][7] = Rook.new(self, [7,7], :white)
    @board[7][1] = Knight.new(self, [7,1], :white)
    @board[7][6] = Knight.new(self, [7,6], :white)
    @board[7][2] = Bishop.new(self, [7,2], :white)
    @board[7][5] = Bishop.new(self, [7,5], :white)
    @board[7][3] = Queen.new(self, [7,3], :white)
    @board[7][4] = King.new(self, [7,4], :white)
  end

  def create_blank_board
    @board = Array.new(8) {Array.new(8)}
  end

  def move(start, end_pos)
    sx, sy = start
    ex, ey = end_pos
    if @board[sx][sy].moves.include?(end_pos)
      if @board[ex][ey].nil?
        replace(start, end_pos)
      elsif @board[ex][ey].color != @board[sx][sy].color
        replace(start, end_pos)
      else
        # error
      end
    end
  end

  def move!(start, end_pos)
    sx, sy = start
    ex, ey = end_pos
    if @board[ex][ey].nil?
      replace(start, end_pos)
    elsif @board[ex][ey].color != @board[sx][sy].color
      replace(start, end_pos)
    else
      # error
    end
  end

  def replace(start, end_pos)
    sx, sy = start
    ex, ey = end_pos

    st_pos_class = @board[sx][sy].class
    st_pos_color = @board[sx][sy].color

    @board[ex][ey] = st_pos_class.new(self, end_pos, st_pos_color)
    @board[sx][sy] = nil
  end

  def render
    0.upto(7) do |x|
      0.upto(7) do |y|
        print '_' + "\n" if @board[x][y].nil? && y == 7
        print '_' if @board[x][y].nil? && y != 7
        print @board[x][y].symbol + "\n" if !@board[x][y].nil? && y == 7
        print @board[x][y].symbol if !@board[x][y].nil? && y != 7
      end
    end
  end

  def find_king(color)
    0.upto(7) do |x|
      0.upto(7) do |y|
        if !@board[x][y].nil? && @board[x][y].symbol == "K" &&
          @board[x][y].color == color
          return [x, y]
        end
      end
    end
  end

  def in_check?(color)
    king_position = find_king(color)
    0.upto(7) do |x|
      0.upto(7) do |y|
        unless @board[x][y].nil?
          return true if @board[x][y].color != color && @board[x][y].moves.include?(king_position)
        end
      end
    end
    false
  end

  def [] (*position)
    x, y = position
    @board[x][y]
  end

  def []=(*args)
    x, y = args[0], args[1]
    @board[x][y] = args[2]
  end


  def deep_dup
    board = Board.new(true)
    0.upto(7) do |x|
      0.upto(7) do |y|
        unless self[x,y].nil?
          board[x, y] = self[x, y].dup
          board[x, y].board = board
        end
      end
    end
    board
  end

end
