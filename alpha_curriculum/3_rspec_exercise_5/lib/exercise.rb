require "byebug"
def zip(*arrays)

    arrays.transpose

end


def prizz_proc(array, prc, block)
    result = []
    array.each do |ele|
        if (!prc.call(ele) && block.call(ele)) || (prc.call(ele) && !block.call(ele))
            result << ele
        end
    end
    result
end

def zany_zip(*arrays)
    long = (arrays.max {|a, b| a.length <=> b.length}).length
    len = arrays.length
    aa = Array.new(long) {Array.new(len)}

    arrays.each_with_index do |arr, arr_index|
        arr.each_with_index do |ele, ele_idx|       
            aa[ele_idx][arr_index] = ele
        end
    end
    aa
end

def maximum(array, &prc)
    return nil if array.empty?
    maxik = array[0]
    array.each do |ele|
        if prc.call(ele) >= prc.call(maxik) 
            maxik = ele
        end
    end
    maxik
end

def my_group_by(array, &prc)

    h = Hash.new {|hash,key| hash[key] = []}
    array.each do |ele|
        h[prc.call(ele)] << ele
    end
h
end


def max_tie_breaker(array, prc, &block)
    return nil if array.empty?
    maxik = array[0]
    array.each do |ele|
        if block.call(ele) > block.call(maxik)
            maxik = ele
        elsif block.call(ele) == block.call(maxik)
            if prc.call(ele) > prc.call(maxik)
                maxik = ele
            end
        else
            maxik
        end
    end
    maxik
end

def vowel_count(word)
    vowels = "aeiou"
    counter = 0

    word.split("").each do |char|
        if vowels.include?(char)
            counter += 1
        end
    end

    counter
end

def first_vowel(word)
    vowels = "aeiou"
    word.split("").each_with_index do |char,idx|
        return idx if vowels.include?(char)
    end

end


def last_vowel(word)
    vowels = "aeiou"
    last = 0
    word.split("").each_with_index do |char,idx|
        if vowels.include?(char)
            last = idx
        end
    end
    last
end


def silly_syllables(sentence)
    result = []
    vowels = "aeiou"
    sentence.split(" ").each do |word|
        if vowel_count(word) < 2 
            result << word
        else
            first = first_vowel(word)
            last = last_vowel(word)

            result << word[first..last]

        end
    end
    result.join(" ")
end