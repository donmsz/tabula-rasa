require "byebug"
def duos(str)
    count = 0
    (0...str.length).each do |i|
        count +=1 if str[i] == str[i+1]
    end
    count
end

def sentence_swap(str, hash)
    new_sent = []
    str.split(" ").each do |word|
        if hash.has_key?(word)
            new_sent << hash[word]
        else
            new_sent << word
        end
    end
    new_sent.join(" ")
end

def hash_mapped(hash, proc, &block)
    h = Hash.new
    hash.each do |key, value|
        h[block.call(key)] = proc.call(value)
    end
    h
end

def counted_characters(string)
    aray = []
    str = string.split("")
    str.each do |e|
        if str.count(e) > 2
            aray << e
        end
    end
    aray.uniq
end

def triplet_true(string)
    (0...string.length - 1).each do |i|
        if string[i] == string[i+1] && string[i] == string[i+2]
            return true
        end
    end
    false
end

def energetic_encoding(string, hash)
    arr = []
    string.each_char do |char|
        if hash.has_key?(char)
            arr << hash[char]
        elsif char == " "
            arr << " "
        else
            arr << "?"
        end
    end
    arr.join("")
end

def uncompress(string)
    arr = []
    i = 0
    while i < string.length
        arr << string[i] * string[i+1].to_i
        i += 2
    end


    arr.join("")
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'