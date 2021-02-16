def bad_two_sum(arr, target_sum)
    arr.combination(2).any? {|ele| ele.sum == target_sum}                 #n^2
end


def okay_two_sum?(arr, target_sum)
    sorted = arr.sort
    sorted.each do |ele|
        needed = target_sum - ele
        return true if bsearch(arr, needed)
    end
    return false                                                                    #worst case: n^2 / avg case: n log n
end
                                                    
def bsearch(arr, target)
    len = arr.length
    return false if len.zero?

    halflen = len / 2
    mid_value = arr[halflen]
    if target == mid_value
        return true
    elsif target < mid_value
        bsearch(arr[0...halflen], target)
    else
        bsearch(arr[(halflen + 1)..-1], target)
    end

end

require "set"
def two_sum?(arr, target)
    #a = Set.new(arr); a.any?{|el| a.include?(target-el)}
    #set << elem
    #set.include?
    #set.each
    #set.any?
    # if two_sum?(arr, target) returns true, => there exist a_1, a_2; a_1 + a_2 == target
    #   as long as (a) exists; we only need to check if (target - a) also exists
    hash = Hash.new

    arr.each do |el|
        hash[el] = el

        return true if (hash.has_key?(target - el)) #do something               O(n)
    end

    false
end


p okay_two_sum?([0, 1, 5, 7], 9)