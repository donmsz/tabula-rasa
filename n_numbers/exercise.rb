require "byebug"

def strange_sums(array)
    result = 0
    (0...array.length-1).each do |i|
        (i+1..array.length-1).each do |j|
            if array[i] + array[j] == 0
                result += 1
            end
        end
    end
    result
end

def pair_product(array, num)
    (0...array.length-1).each do |i|
        (i+1..array.length-1).each do |j|
            return true if array[i] * array[j] == num
        end
    end
    false
end

def rampant_repeats(string, hash)

    string.chars.map do |char|
        if hash.has_key?(char)
            char = char * hash[char]
        else
            char
        end
    end.join
end

def perfect_square(num)
    (1..num).each do |i|
        if i * i == num
            return true
        end
    end
    false
end


def divis(num)
    divisors = []
    (1..num).each do |i|
        if num % i == 0
            divisors << i
        end
    end
    divisors.length
end

def anti_prime?(num)
    (1...num).each do |i|
        if divis(num) < divis(i)
            return false
        end
    end
    true
end

def matrix_addition(mtx_a, mtx_b)

    result = []
    mtx_a.each_with_index do |array,index|
        result_row = []
        array.each_with_index do |element, idx|
            result_row << element + mtx_b[index][idx]
        end
        result << result_row
    end

    result
end

def mutual_factors(*nums)
    result = []
    (1..nums.max).each do |i|
        result << i if nums.all?{ |num| num % i == 0}
    end
    result
end

def tribonacci_number(number)
    return 1 if number == 1
    return 1 if number == 2
    return 2 if number == 3    
    return tribonacci_number(number-1) + tribonacci_number(number-2) + tribonacci_number(number-3)
end

def matrix_addition_reloaded(*mtx)
    result = []
    return mtx if mtx.length == 1
    return matrix_addition(mtx[0],mtx[1]) if mtx.length == 2
    if mtx.all? {|arr| arr.length == mtx[0].length} 
        mtx[0].each_with_index do |array,row_index|
            result_row = []
            array.each_with_index do |elem, col_index|
                sum = elem
                (1...mtx.length).each do |m|
                    sum += mtx[m][row_index][col_index]
                end
                result_row << sum
            end
            result << result_row
        end
    else
        return nil
    end
    result
end

def squarocol?(array)
    array.each do |row|
        return true if row.all? {|i| row[0] == i }
    end
    array.transpose.each do |row|
        return true if row.all? {|i| row[0] == i }
    end
    false
end

def squaragonal?(array)
    left = true
    right = true
    (0...array.length - 1).each do |i|
        if array[i][i] != array[i+1][i+1]
            left = false
        end
        if array[i][-i - 1] != array[i+1][-i - 2]
            right = false
        end
    end
    left || right
end

def pascals_triangle(num_rows)
triangle = []

num_rows.times do |row|
  current_row = []
  
  row.times do |col|
    if col.zero? || col == row - 1
      current_row << 1
    else
      current_row << triangle[row - 1][col - 1] + triangle[row - 1][col]
    end
  end
  
  triangle << current_row
end

triangle
end


def prime?(num)
    return false if num < 2

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true

end



def mersenne_prime(num)
    primes = []
    i = 2
    while primes.length < num
        primes << i - 1 if prime?(i - 1)

        i *= 2
    end

    primes[num-1]
end

def triangular_word?(word)

    alp = "_abcdefghijklmnopqrstuvwxyz"
    check = 0
    
    word.chars do |char|
        check += alp.index(char)
    end
    i = 1
    while true
        if ((i * (i + 1)) / 2) == check
            return true
        elsif ((i * (i + 1)) / 2) > check
            return false
        end
        i += 1
    end
end


def consecutive_collapse(array)
    i = 0
    while true
        return array if array.length < 2
        return array if i >= array.length - 1 
        if array[i] - array[i+1] == 1 || array[i] - array[i+1] == -1
            array.delete_at(i+1)
            array.delete_at(i)
            i = 0
        elsif array.length == 2 
            if array[0] != array[1]
                return array
            end
        else
            i += 1
        end
    end
    array
end

def pretentious_primes(array,number)
    result = []

    
    array.each do |num|
        primes = []
        if number > 0 
            #debugger
            i = num + 1
            while primes.length < number
                if prime?(i)
                    primes << i
                end
                i += 1
            end
        else number < 0 
            i = num - 1
            while primes.length < -number
                primes << nil if i < 2
                if prime?(i)
                    primes << i
                end
                i -= 1
            end
        end
        result << primes[-1]
    end


    result
end


p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]