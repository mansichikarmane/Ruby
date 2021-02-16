require "Stepable.rb"
require "Piece.rb"

class Knight < Piece
    include Stepable
    
    
      
    def symbol
        @symbol = :♞
    end
    

    private
    def move_dirs
        @move_dirs = KNIGHT_DIRS
    end
    


end