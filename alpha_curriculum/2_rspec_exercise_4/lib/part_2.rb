def proper_factors(number)
    result = []
    (1...number).each do |i|
        result << i if number % i == 0
    end
    result
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(number)
    aliquot_sum(number) == number
end

def ideal_numbers(number)
    result = []
    i = 6
    while result.length < number
        result << i if perfect_number?(i)
        i += 1
    end
    result
end