
require "byebug"
module Slideable
  private
  HORIZONTAL_DIRS = [[1,0], [0,1], [-1,0], [0, -1]] #adding, or subtracting, to one index, keeping the other the same
  DIAGONAL_DIRS = [[1,1], [-1, -1], [1,-1], [-1, 1]] #adding, or subtracting, the same amnt to both indexes

  public

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  #moves returns array of all possible positions, use move_dirs to iterate over correct direction
  #use move dirs -> check if we can go hor, diag, or BOTH
  def moves
    all_moves = []
    move_dirs.each do |ele|
      all_moves.concat(grow_unblocked_moves_in_dir(ele[0], ele[1]))                       
    end
    all_moves
  end

  #move dirs, raise error, filters
  def move_dirs
    
  end

 

  def grow_unblocked_moves_in_dir(destination_x, destination_y)
    current_x, current_y = self.pos
   
    unblocked_moves = []

    next_x = current_x + destination_x
    next_y = current_y + destination_y
    until (next_x > 6 || next_x < 1) || (next_y > 6 || next_y < 1)
      # if ( (next_x >= 7 || next_x <= 0) || (next_y >= 7 || next_y <= 0) )

        unless @board[[next_x, next_y]].is_a?(Piece)
          # debugger
          unblocked_moves << [next_x, next_y]
          next_x += destination_x
          next_y += destination_y 
        end
    end
    unblocked_moves
  end





  
  
end

