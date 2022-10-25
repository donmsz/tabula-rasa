def proper_factors(num)
    arr = []
    (1...num).each do |i|
        arr << i if num % i == 0
    end
    arr
end

def aliquot_sum(num)
    proper_factors(num).reduce(0) {|sum, num| sum + num}
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(num)
    arr = []
    i = 1
    while num > arr.length 
        arr << i if perfect_number?(i)
        i += 1
    end
    arr
end