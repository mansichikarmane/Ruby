require "Stepable.rb"
require "Piece.rb"

class King < Piece
    include Stepable
    

      
    def symbol
        @symbol = :♚
    end
    

    private
    def move_dirs
        @move_dirs = KING_DIRS
    end
    


end