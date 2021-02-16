require "benchmark"

def my_min(arr)
    min = arr[0]
    arr.each.with_index do |ele, i|
        min = arr[i] if arr.none? {|num| num < ele}                                                                                                                 #n^2
    end
    return min
end


def my_min_phase_2(arr)
    min = arr[0]
    arr.each do |ele|
        min = ele if ele < min                                                                                                                                      #linear
    end
    return min
end

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum.
# Find the sums of all contiguous sub-arrays and return the max.

def largest_contiguous_subsum(arr)
    len = arr.length
    max = arr[0]
    (0...len).each do |i|
        (0..i).each do |j| #arr[i-1..i] == [arr[i-1], a[i]]                                                                         
            sum = arr[j..i].sum
            max = sum if max < sum                                                                                                                                  #n^3
        end
    end
    max
end

# Phase II
# Let's make a better version.
# Write a new function using O(n) time with O(1) memory.
# Keep a running tally of the largest sum.
# To accomplish this efficient space complexity, consider using two variables.
# One variable should track the largest sum so far and another to track the current sum.
# We'll leave the rest to you.

# Get your story straight, and then explain your solution's time complexity to your TA.

def largest_contiguous_subsum_v2(arr)
    #bottom_sum: min sum from the beginning of the array so far
    #top_sum: max sum from the beginning of the array so far, but to the right of the bottom_sum index
    #curr_sum: the sum from the beginning of the array to the current element being iterated
    #max_sum
    # if curr_sum < bottom_sum
    #   bottom_sum = curr_sum
    #   top_sum = curr_sum
    # if curr_sum > top_sum
    #   top_sum = curr_sum
    #   max_sum = [max_sum, top_sum - bottom_sum].max

    max_sum = arr[0]
    curr_sum = nil
    bottom_sum = 0
    top_sum = arr[0]

    arr[0..-1].each_with_index do |ele, i|
        curr_sum = (curr_sum || 0) + ele                                                                                                            #O(n)

        if curr_sum < bottom_sum
            bottom_sum = curr_sum
            top_sum = bottom_sum
            max_sum = [max_sum, bottom_sum].max 
        else
            top_sum = curr_sum if curr_sum > top_sum
            max_sum = [max_sum, top_sum - bottom_sum].max
        end
        
    end

    max_sum
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list)
# p largest_contiguous_subsum_v2(list)

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1
# p largest_contiguous_subsum_v2(list) # => -1

list = Array.new(2000){rand(-1e6..1e6)}

Benchmark.bm do |b|
    b.report("slow subsum"){largest_contiguous_subsum(list)}
    b.report("faster subsum"){largest_contiguous_subsum_v2(list)}
end


    # max_sum = arr[0]
    # curr_sum = arr[0]
    # bottom_sum = arr[0]
    # top_sum = arr[0]

    # arr[0..-1].each_with_index do |ele, i|
    #     curr_sum += ele

    #     if curr_sum < bottom_sum
    #         max_sum = [max_sum, curr_sum - bottom_sum].max
    #         bottom_sum = curr_sum
    #         top_sum = bottom_sum
    #     else
    #         if curr_sum > top_sum
    #             top_sum = curr_sum
    #         end

    #         max_sum = [max_sum, top_sum - bottom_sum].max
    #     end

    #     p [i + 1, top_sum, bottom_sum, max_sum]
    # end

    # max_sum