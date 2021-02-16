def first_anagram?(string1, string2)
string1.split("").permutation.any? {|arr| arr.join == string2}                               #n * n!
end

def second_anagram?(string1, string2)
    string1.each_char do |char|
        i = string2.index(char)                                                                             
        string2[i] = "" if i                                                                 #n^2
    end
    string2.empty?
end

def third_anagram?(string1, string2)
    string1.split("").sort == string2.split("").sort                                          # (n log (n))
end 

def fourth_anagram(string1, string2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    string1.each_char do |char|
        hash1[char] += 1                                                                        #linear
    end
    string2.each_char do |char|
        hash2[char] += 1
    end
    
    hash1 == hash2
end

def bonus_anagram(string1, string2)
    hash1 = Hash.new(0)

    string1.each_char do |char|
        hash1[char] += 1
    end                                                                                         #linear
    string2.each_char do |char|
        hash1[char] -= 1
    end

    hash1.all? {|_, v| v.zero?}


end