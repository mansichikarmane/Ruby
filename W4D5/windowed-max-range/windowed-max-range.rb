def windowed_max_range(array, window_size)  #O(n^2)
  curr_max_range = nil
  len = array.length
  sub_arr = []
  new_arr = []
  # (window_size...len).each do |i|
  #   sub_arr = arr[i - window_size...i]
  (0...len).each do |i|                     
    next if i + window_size > len
    sub_arr << array.slice(i, window_size)#[i...i + window_size]   
  end

  sub_arr.each do |ele|                     
    max = ele.max
    min = ele.min
    range = max - min
    new_arr << range
  end

  new_arr.max                               
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8