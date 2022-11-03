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
        byebug
        i.times do |j|
            a[i] << a[i-1][j] + ((a[i-1][j-1]) || 0)
        end
    end

    #a[i] << a[i-1][i-1] + ((a[i-2][i-1]) || 0) 
    a

end


p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]