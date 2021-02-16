require "./Piece.rb"

class Board
    
    def initialize
        @rows = Array.new(8) { Array.new(8, nil) }
        @rows.each_with_index do |row, row_number|
            if row_number < 2 && row_number > 5
                row.each do |tile|
                    tile = Piece.new
                end
            end
        end
    end
    
    def [](pos)
        x = pos[0]
        y = pos[1]
        @rows[x, y]
    end

    def []=(pos, val)
        x = pos[0]
        y = pos[1]
        @rows[x, y] = val 
    end

    def move_piece(start_pos, end_pos)
        #if start pos is valid, reassign the piece from start_pos to end_pos and remove piece from start_pos (updating board)
        #check start and end to see if they contain pieces, and if they are valid (on the grid)
        if start_pos == Piece.new && end_pos == nil
            @rows[start_pos] == nil 
            @rows[end_pos] == Piece.new
        elsif start_pos != Piece.new
            raise "Error: Invalid starting position"
        else
            raise "Error: Invalid ending position"
        end


    end






end