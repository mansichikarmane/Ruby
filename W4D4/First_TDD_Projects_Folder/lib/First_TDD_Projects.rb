require "byebug"

class Array

    def my_uniq
        new_array = []
        self.each do |ele|
            new_array << ele unless new_array.include?(ele)
        end
        new_array
    end

    def two_sum
      new_array = []
      self.each_with_index do |ele1, idx1|
        self.each_with_index do |ele2, idx2|
          if idx1 < idx2
            if ele1 + ele2 == 0
              new_array << [idx1,idx2]
            end 
          end
        end
      end
      new_array
    end

    def my_transpose
      new_arr = []
      self.each_with_index do |ele, row_idx|
        holder = []
        ele.each_index do |col_idx|
          holder << self[col_idx][row_idx]
        end
        new_arr << holder
      end
      new_arr
    end

    def stock_picker
      most_profit = []
      # debugger
      (0...self.length).each do |i|
        ((i + 1)...self.length).each do |j|
          if most_profit.empty?
            most_profit = [i, j]
          else
            current_diff = (self[j] - self[i])
            highest_diff = (self[most_profit[1]] - self[most_profit[0]])
            if current_diff > highest_diff
              most_profit = [i, j]
            end
          end
        end
      end
      most_profit
    end

end

class Towers
  def initialize
    @board = [[1,2,3,4,5,6,7,8],[],[]]
  end

  def move(start, destination)
    @board[destination].unshift(@board[start].shift)
  end

  def gets_move
    print 'Enter two indices indicating where you want to pull a disk from and where you want it to go'
    input = gets.chomp
    input_arr = input.split(" ")
    start = input_arr[0]
    destination = input_arr[1]
  end
end