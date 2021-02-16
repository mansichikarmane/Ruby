
class Piece

    def initialize(color, board, pos)   
        @color = color
        @board = board
        @pos = pos
    end

    def color
        @color
    end

    def board
        @board
    end

    def pos
        @pos
    end

    def to_s #rook.to_s == rook? , get into the ins var's and turn to string for the user
       
    end

    def pos=(val)
        self.pos = val
    end

    def symbol #represents color

    end

end