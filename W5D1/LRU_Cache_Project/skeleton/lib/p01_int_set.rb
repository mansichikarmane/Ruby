require "byebug"

class MaxIntSet

  attr_reader :store 

  def initialize(max) 
    @max = max
    @store = Array.new(max + 1, false)  #0-50 (51 indices)

  end

  def insert(num)
    if num > -1 && num < 51
      @store[num] = true 
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
    else
      return false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store 

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % num_buckets
    @store[idx] << num
  end

  def remove(num)
    idx = num % num_buckets
    @store.delete_at(idx)
  end

  def include?(num)
    idx = num % num_buckets
    if @store[idx].include?(num)
      return true
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  # debugger
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end



  def insert(num)
    idx = num % num_buckets
    if count > num_buckets 
      self.resize!
      self.insert(num)
    elsif !@store[idx].include?(num)
      @store[idx] << num
      @count += 1
    end
  end

  def remove(num)
    idx = num % num_buckets
    if @store[idx].include?(num)
      @store.delete_at(idx)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % num_buckets
    if @store[idx].include?(num)
      return true
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize! #reassign store variable
    new_size = @num_buckets * 2
    @store = Array.new(new_size) { Array.new }
  end
end
