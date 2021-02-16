require "Piece.rb"
require "Slideable.rb"
class Queen < Piece
include Slideable
  
  def symbol
    @symbol = :♛
  end

  private
  def move_dirs
    @move_dirs = HORIZONTAL_DIRS + DIAGONAL_DIRS               #ask about this
  end

end