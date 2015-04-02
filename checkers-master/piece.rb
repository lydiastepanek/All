require_relative 'board'
#require 'byebug'

class Piece

  attr_reader :color, :board, :symbol
  attr_accessor :position

  def initialize(color, board, position)
    @color = color
    @board = board      #b[6, 1].board[6,1].symbol
    @position = position
    @symbol = '<>'
  end

  DELTAS = [[1,-1],[1,1],[2,-2],[2,2]]

  def within_bounds?(pos)
    pos[0].between?(0,9) && pos[1].between?(0,9)
  end

  def occupied_by_you?(pos)
    !board[*pos].nil? && board[*pos].color == self.color
  end

  def all_moves
    x, y = @position
    i = @color == :black ? 1 : -1
    DELTAS.each_with_object([]) do |(dx, dy), moves|
      pos = [x + (dx * i), y + (dy * i)]
      moves << pos if within_bounds?(pos) && !occupied_by_you?(pos)
    end
  end

  def take_position(to)
    board[*to] = self
    board[*(self.position)] = nil
    self.position = to
  end

  def perform_slide(to) #b[3,4].perform_slide([4,3])
    if self.all_moves.include?(to) && board[*to].nil? && distance(to) == 1
      take_position(to)
    end
  end

  def perform_jump(to)
    if (self.all_moves.include?(to) &&
     !board[*avg(to)].nil? &&
     board[*avg(to)].color != self.color)
      board[*self.avg(to)] = nil
      #i may need to delete that piece object here
      take_position(to)
    end
  end

  def distance(to)
    dx, dy = to
    (dx - position[0]).abs
  end

  def avg(to)
    dx, dy = to
    [(position[0] + dx) / 2, (position[1] + dy) / 2]
  end

  def maybe_promote
    promote = false
    if self.color == :white && position[0] == 0 ||
      self.color == :black && position[0] == 9
      promote = true
    end
    promote
  end

  def perform_moves!(arr)
    if arr.length == 1
      raise InvalidMoveError unless (perform_slide(arr[0]) || perform_jump(arr[0]))
    elsif arr.length > 1
      arr.each do |current_move|
        raise InvalidMoveError unless (perform_jump(current_move))
      end
    end
  end

  def valid_move_seq?(arr)
    begin
      new_board = board.deep_dup
      new_board[*self.position].perform_moves!(arr)
    rescue  InvalidMoveError => e
      puts "Error was: #{e}"
      return false
    else
      return true
    end
  end

  def perform_moves(arr)
    valid_move_seq?(arr)
    perform_moves!(arr)
  end

end

class InvalidMoveError < StandardError
end
