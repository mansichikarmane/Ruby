require_relative "PolyTreeNodeCopy.rb"

class KnightPathFinder

    attr_reader :start_pos
    attr_accessor :root_node

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [@start_pos]
        self.build_move_tree
    end

    # def bfs(target_value)
    #     queue = [self]
    #     until queue.empty?
    #         el = queue.shift
    #         if el.value == target_value
    #           return el
    #         else
    #             el.children.each do |child|
    #                 if child == target_value
    #                     return target_value
    #                 else
    #                  queue << child
    #                 end
    #             end
    #         end
    #     end
    #   end

    #create root with start position
    #move root into queue
    #find children nodes from first ele in queue(root) then remove that ele
    #move children into queue
    #repeat

    def build_move_tree
        @root_node = PolyTreeNodeCopy.new(@start_pos)
        queue = [@root_node]
            until queue.empty?
                el = queue.shift
                new_move_positions(el.value).each do |val|
                   queue << el.add_child(PolyTreeNodeCopy.new(val)
                end
            end

    end

    def self.valid_moves(start_pos)
        valid_moves_arr = []
        #[0,0]
        # add 1 or 2 to idx0 // sub 1 or two to idx 0 
        # add 2 or 1 to idx1 // sub 2 or 1 to idx 1
        #0 - 8
        moves = [[1, 2], [-1, 2], [1, -2], [-1, -2], [-2, 1], [2, -1], [2, 1], [-2, -1]]
        moves.each do |move|
            if (!(start_pos[0] + move[0] < 0) && !(start_pos[0] + move[0] > 7)) && (!(start_pos[1] + move[1] < 0) && !(start_pos[1] + move[1] > 7))
                    valid_moves_arr << [start_pos[0] + move[0] ,  start_pos[1] + move[1]]
            end
        end
        valid_moves_arr
        
    end

    def new_move_positions(pos)
    add_array = []
    valid_moves_arr = self.valid_moves(pos)  
        valid_moves_arr.each do |valid_move|

            if !@considered_positions.include?(valid_move)
                add_array << valid_move
                @considered_positions << valid_move
            end
        end
        return add_array
    end

end