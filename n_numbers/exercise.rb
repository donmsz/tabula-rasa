require "byebug"
## JEDYNCZEKA 

def strange_sums(array)
    count = 0
    array.each do |ele|
        if array.include?(-ele)
            count += 1
        end
    end
    count / 2
end

def pair_product(array, prod)
    i = 0
    byebug
    (i...array.length - 1).each do |ele|
        (i + 1...array.length).each do |e|
            return true if array[ele] * array[e] == prod
        end
        i += 1
    end
    false
end

def rampant_repeats(string,hash)
    result = []
    string.split("").each do |char|
       if hash.key?(char)
        result << char * hash[char]
       else
        result << char 
       end
    end
    result.join("")
end

def perfect_square(num)
    (1..num).each do |i|
        return true if i * i == num
    end
    false    
end
##DWOJECZKA

def div(num)
    count = 0

    (1..num).each do |i|
        if num % i == 0 
            count += 1
        end
    end
    count
end

def anti_prime?(num)
    (1...num).each do |i|
        return false if div(i) > div(num)
    end
    true
end

def matrix_addition(mtx_a, mtx_b)
    a = Array.new(mtx_a.length) {Array.new(mtx_a[0].length,0)}
    (0...mtx_a.length).each do |i|
        (0...mtx_a[0].length).each do |j|
            a[i][j] = mtx_a[i][j]+mtx_b[i][j]
        end
    end
    a
end

def mutual_factors(*number)
    result =[]
    (1..number.max).each do |i|
        if number.all? {|num| num % i == 0}
            result << i
        end
    end
    result
end

def tribonacci_number(num)
    return 1 if num == 1 || num == 2
    return 2 if num == 3
    tribonacci_number(num-1) + tribonacci_number(num-2) + tribonacci_number(num-3)
end
# TROJECZKA
def matrix_addition_reloaded(*matrices)
    return nil if matrices.any?{|i| i.length != matrices[0].length }
    a = Array.new(matrices[0].length) {Array.new(2,0)}
        matrices.each_with_index do |array|
            array.each_with_index do |ele,index|
                ele.each_with_index do |i,idx|
                    a[index][idx] += i
                end
            end
        end
    a
end

def squarocol?(array)
    array.any?{|arr| arr.all?{|i| i == arr[0]} } || array.transpose.any?{|arr| arr.all?{|i| i == arr[0]} }
end

def squaragonal?(array) 
    first = []
    second = []
    (0...array.length).each do |i|
            first << array[i][i]
            second << array[i][-i-1]
    end
    first.uniq.count <= 1 || second.uniq.count <= 1
end

def pascals_triangle(num)
    a = Array.new (num) {Array.new}
    a[0] << 1
    (1..num).each do |i|
        
    end

    #a[i] << a[i-1][i-1] + ((a[i-2][i-1]) || 0) 
    a

end


#p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]
def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def mersenne_prime(num)
    arr = []
    i = 1
    while arr.length < num
        if is_prime?(2 ** i - 1)
            arr << 2 ** i - 1
        end
        i += 1
    end
    arr[num - 1]
end

def triangular_word?(string)
    alph = "abcdefghijklmnopqrstuvwxyz"    
    num = 0
    string.each_char do |char|
        num += alph.index(char) + 1
    end
    (1..num).each do |i|
        return true if num == (i * (i + 1)) / 2
    end
    false
end

def consecutive_collapse(array)
    iksde = true
    i = 0
    while iksde 
        #byebug
        if (array[i] - array[i+1] == 1) || (array[i] - array[i+1] == -1)
            array = array[0...i] + array[i+2..-1]
            i = 0
        else
            i += 1
        end

        if i == array.length - 1 || array.length < 2
            iksde = false
        end
    end
    array
end
def greater(elem,nextt)
    count = 0
    i = 1
    result = 0
    while count < nextt
        if is_prime?(elem + i)
            result = elem + i
            count += 1
        end
        i += 1
    end
    result
end

def lesser(elem,nextt)
    #byebug
    count = 0
    i = 1
    result = 0
    while count > nextt
        if is_prime?(elem - i)
            result = elem - i
            count -= 1
        elsif elem - i < 2
            return nil
        end
        i += 1
    end
    result
end

def pretentious_primes(array, num)
    arr = []
    array.each do |ele|
        if num > 0
            arr << greater(ele,num)
        elsif num < 0
            arr << lesser(ele,num)
        end
    end
    arr
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