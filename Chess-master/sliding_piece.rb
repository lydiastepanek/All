require_relative 'piece'
require 'byebug'

class SlidingPiece < Piece

  def lateral_moves
    lateral_moves = []

    (0..7).each do |i|
      lateral_moves << [@position[0], i]
      lateral_moves << [i, @position[1]]
    end
    lateral_moves.reject { |pos| pos == @position }
  end

  def diagonal_moves
    diagonal_moves = []

    (1..7).each do |i|
      diagonal_moves << [@position[0] + i, @position[1] + i]
      diagonal_moves << [@position[0] - i, @position[1] - i]
      diagonal_moves << [@position[0] + i, @position[1] - i]
      diagonal_moves << [@position[0] - i, @position[1] + i]
    end
    diagonal_moves
  end

  def accessible_lateral_moves(lateral_moves)
    x, y = @position[0], @position[1]
    lateral_moves_copy = lateral_moves.dup

    lateral_moves_copy.each do |lx, ly|
      if !@board[lx, ly].nil?
        start = ( @board[lx, ly].color == color ? 0 : 1 )
        if lx < x && ly == y # up moves
          start.upto(7) do |i|
            lateral_moves.delete([lx-i, y])
          end
        elsif lx == x && ly < y # left moves
          start.upto(7) do |i|
            lateral_moves.delete([x, ly-i])
          end
        elsif lx > x && ly == y # down moves
          start.upto(7) do |i|
            lateral_moves.delete([lx+i, y])
          end
        elsif lx == x && ly > y # right moves
          start.upto(7) do |i|
            lateral_moves.delete([x, ly+i])
          end
        end
      end
    end
    lateral_moves
  end

  def accessible_diagonal_moves(diagonal_moves)
    x, y = @position[0], @position[1]
    diagonal_moves_copy = diagonal_moves.dup

    diagonal_moves_copy.each do |lx, ly|
      if !@board[lx, ly].nil?
        start = ( @board[lx, ly].color == color ? 0 : 1 )
        if lx < x && ly < y # quadrant 1
          start.upto(7) do |i|
            diagonal_moves.delete([lx-i, ly-i])
          end
        elsif lx < x && ly > y # quadrant 2
          start.upto(7) do |i|
            diagonal_moves.delete([lx-i, ly+i])
          end
        elsif lx > x && ly < y # quadrant 3
          start.upto(7) do |i|
            diagonal_moves.delete([lx+i, ly-i])
          end
        elsif lx > x && ly > y # right moves
          start.upto(7) do |i|
            diagonal_moves.delete([lx+i, ly+i])
          end
        end
      end
    end
    diagonal_moves
  end

end
