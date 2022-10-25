require "byebug"
def zip(*arrays)
    
    arr = Array.new(3) {Array.new}
    arrays.each do |array|
        array.each_with_index do |ele,idx|
        arr[idx] << ele 
        end
    end
    arr
end

def prizz_proc(array, prc, block)
    new_arr = []
    array.each do |i|
        if prc.call(i) && !block.call(i) || !prc.call(i) && block.call(i)
            new_arr << i 
        end
    end
    new_arr
end

def zany_zip(*arrays)
    max = arrays.max {|a,b| a.length <=> b.length}
    result = Array.new(max.length) {Array.new(arrays.length)}
    arrays.each_with_index do |array, index|
        array.each_with_index do |ele, idx|
            result[idx][index] = ele
        end
    end

    result
end

def maximum(array, &prc)
    return nil if array.empty?

    max = prc.call(array[0])
    result = array[0]

    array.each do |ele|
        if prc.call(ele) >= max
            max = prc.call(ele)
            result = ele
        end
    end
    result
end

def my_group_by(array, &prc)
    h = Hash.new {|hash, key| hash[key]=[]}
    array.each do |ele|
        h[prc.call(ele)] << ele
    end
    h
end

def max_tie_breaker(array, prc, &block)
    return nil if array.empty?
    
    max = block.call(array[0])
    result = array[0]
    array.each do |ele|
        if prc.call(ele) == max
            max = prc.call(ele)
            result = ele
        elsif block.call(ele) > max
            max = block.call(ele)
            result = ele
        end
    end
    result
end

def vowel_count(word)
    count = 0
    vowel = "aeiou"
    word.each_char do |i|
        if vowel.include?(i)
            count +=1
        end
    end
    count
end


def f(word)
    vowel = "aeiou"
    result = 0
    word.each_char.with_index do |c,i|
        if vowel.include?(c)
            return i
        end
    end
end

def l(word)
    vowel = "aeiou"
    result = 0
    word.each_char.with_index do |c,i|
        if vowel.include?(c)
            result = i
        end
    end
    result
end

def silly_syllables(sentence)
    result = []
    sentence.split(" ").each do |word|
        if vowel_count(word) < 2
            result << word
        else
            el = word.split("")
            result << el[f(word)..l(word)].join()
        end
    end

    result.join(" ")
end