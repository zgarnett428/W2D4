require "byebug"

def no_dupes?(arr)
    new_arr = []
    count = Hash.new(0)

    arr.each { |ele| count[ele] += 1 }
    count.each { |k, v| new_arr << k if v == 1 }
    
    new_arr
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
       return false if arr[i] == arr[i + 1]
    end
    true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    count = Hash.new {|h, k| h[k] = [] }
    str.each_char.with_index { |char, i| count[char] << i }
    count
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    chars = str.split("")

    chars.intersection(chars.uniq)



end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    (2...num).each do |fac_1|
        (2...num).each do |fac_2|
            return true if prime?(fac_1) && prime?(fac_2) && fac_1 * fac_2 == num
        end
    end
    false
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |cand| num % cand == 0 }
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    long_keys = keys * 26

    message.each_char.with_index do |char, char_i |
        alpha.each.with_index do |let, let_i|
            if char == let
                message[char_i] = alpha[(let_i + long_keys[let_i])]
            end
        end
    end

    message 

end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
