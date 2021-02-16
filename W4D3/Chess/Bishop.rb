require "Piece.rb"
require "Slideable.rb"

class Bishop < Piece
include Slideable
  
  
  def symbol
    @symbol = :♝
  end

  private
  def move_dirs
    @move_dirs = DIAGONAL_DIRS
  end

end
