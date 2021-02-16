class PolyTreeNode

    attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(node)
    old_parent = self.parent
    if old_parent != nil
      old_parent.children.delete(self)
    end
    @parent = node
    if node == nil
    else
        if !node.children.include?(self)
            node.children << self
        end
    end

  end

  def add_child(child_node)
   if !self.children.include?(child_node)
        child_node.parent = self
   end
  end

  def remove_child(child_node)
  
    if self.children.include?(child_node)
       child_node.parent = nil
    else
      raise
    end
   end

  def dfs(target)
  return self if self.value == target

  self.children.each do |child|
    search_result = child.dfs(target)
    return search_result unless search_result.nil?
  end
  nil
    end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
        el = queue.shift
        if el.value == target_value
          return el
        else
            el.children.each do |child|
                if child == target_value
                    return target_value
                else
                 queue << child
                end
            end
        end
    end
  end

end

