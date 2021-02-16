# require "./Piece.rb"
require "byebug"
require_relative "Rook"
class Board
    
    def initialize
        @rows = Array.new(8) { Array.new(8, nil) }
        # @rows.each_with_index do |row, row_number|
        #     if (row_number < 2) || (row_number > 5)
        #         (0...row.length).each do |tile_idx|
        #             self[[row_number, tile_idx]]= Piece.new(color, board, pos)
        #         end
        #     end
        # end
    end
    
    def [](pos)
        x = pos[0]
        y = pos[1]
        @rows[x][y]
    end

    def []=(pos, val)
        x = pos[0] #y axis, vertical pos of rows
        y = pos[1] #x axis, horizontal pos of tile in each row
        @rows[x][y]= val 
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].is_a?(Piece) && !self[end_pos].is_a?(Piece)
            mover = self[start_pos]
            self[start_pos]= nil 
            self[end_pos]= mover
        else
            raise "Invalid starting or ending position"
        end
        
    end

end

b = Board.new

# b.move_piece([0,0], [3,3])
# p b
r = Rook.new(:W, b, [0, 0])

b[[0, 0]] = r
p b
p r.moves