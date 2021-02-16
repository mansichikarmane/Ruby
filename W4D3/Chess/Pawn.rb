require "Piece"


class Pawn < Piece



    def symbol
        @symbol = :♙️
    end
    
    def moves
        moves = []
        self.forward_steps.each do |pos|
            if !@board[pos].is_a?(Piece) && pos.each { |ele| (0...7).include?(ele) }
                moves << pos
            end
        end
        moves
    end

    def at_start_row?
        x, y = self.pos
        if y == 1 || y == 6
            return true
        else
            return false
        end
    end

    def forward_dir
        if @color == :W
            return 1
        else
            return -1
        end
    end

    def forward_steps
        possible_moves = []
        if self.forward_dir == -1
            if self.pos.at_start_row?
               possible_moves << [self.pos[0], ((self.pos[1].to_i) - 1)], [self.pos[0], ((self.pos[1].to_i) - 2)]   # << [0, -1], [0, -2]
            else
               possible_moves << [self.pos[0], ((self.pos[1].to_i) - 1)]
            end
        else
            if self.pos.at_start_row?
               possible_moves << [self.pos[0], ((self.pos[1].to_i) + 1)], [self.pos[0], ((self.pos[1].to_i) + 2)]   
            else
               possible_moves << [self.pos[0], ((self.pos[1].to_i) + 1)]
            end
        end
        possible_moves
    end

    def side_attacks
    end

end