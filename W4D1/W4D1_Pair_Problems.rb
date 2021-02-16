# 1. Write a method `bfs` that does a breadth-first search starting at a root node.
# It takes in a target, and a proc as an argument.



class Node

    def bfs(target, &prc)
        raise "error" if [target, prc].empty?


        queue = [self]
        if queue.shift.call == target
            return self
        else
            self.children.each do |child|
                queue.push(child)
                queue.bfs(target, &prc)
            end
        end
    
    end

   
end