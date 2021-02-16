module Stepable

    
        private
        KING_DIRS = [[0, 1], [1, 1], [1, 0], [-1, -1], [-1, 0], [0, -1], [1, -1], [-1, 1]]
        KNIGHT_DIRS = [[-1, 2], [1, 2], [-1, -2], [1, -2], [2, -1], [2, 1], [-2, -1], [-2, 1]]


        public
      
        def knight_dirs
            KNIGHT_DIRS
        end
      
        def king_dirs
            KING_DIRS
        end
      
        #moves returns array of all possible positions, use move_dirs to iterate over correct direction
        #use move dirs -> check if we can go hor, diag, or BOTH
        


        #iterating through all possible moves.
        #shovel into all moves, the result of combining the self position with all possible move positions IF move is valid
        def moves
          all_moves = []
          self.move_dirs.each do |move|                                         
            if ((0..7).include?(self.pos[0] + move[0]) && (0..7).include?(self.pos[1] + move[1])) && !(@board[(self.pos[0] + move[0]), (self.pos[1] + move[1])].is_a?(Piece))   #|| self.color == 
                all_moves << [(self.pos[0] + move[0]), (self.pos[1] + move[1])]
            end                     
          end
          all_moves
        end
      
        #move dirs, raise error, filters
        def move_dirs
          
        end
      


    
     





end