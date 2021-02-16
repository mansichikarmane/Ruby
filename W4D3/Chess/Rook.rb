require_relative "Piece"
require_relative "Slideable"

class Rook < Piece
include Slideable
  
  
  def symbol
    @symbol = :♜
  end

  private
  def move_dirs
    @move_dirs = HORIZONTAL_DIRS
  end

end