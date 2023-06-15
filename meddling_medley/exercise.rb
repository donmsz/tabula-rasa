require "byebug"

def duos(word)
    counter = 0
        (0...word.length - 1).each do |i|
            if word[i] == word[i+1]
                counter += 1
            end
        end
    counter
end

def sentence_swap(sentence, hash)
    result = []
        sentence.split(" ").each do |word|
            if hash.has_key?(word)
                result << hash[word]
            else
                result << word
            end
        end
    result.join(" ")
end

def hash_mapped(hash, prc, &block)
    h = Hash.new
        hash.each do |key, value|
            h[block.call(key)] = prc.call(value)
        end
    h
end

def counted_characters(sentence)
    result = []
    chars = sentence.split("")
     
        chars.each do |char|
            if chars.count(char) > 2
                result << char
            end
        end
    result.uniq
end


def triplet_true(word) 
    return false if word.length < 3
    (0...word.length-2).each do |i|
        if word[i] == word[i+1] && word[i] == word[i+2]
            return true
        end
    end
    false
end

def energetic_encoding(string, hash)
    result = []
        string.split("").each do |char|
            if hash.has_key?(char)
                result << hash[char]
            elsif char == " "
                result << " "
            else
                result << "?"
            end
        end
    result.join("")
end


def uncompress(word)

    i = 0
    result = []
    while i < word.length
        result << word[i] * word[i+1].to_i
        i += 2
    end
    result.join("")
end


def conjunct_select(array, *procs)

    result = []
        array.each do |ele|
            if procs.all?{|proc| proc.call(ele)}
                result << ele
            end
        end
    result
end

def first_vowel(word)
    vowel = "aeiouAEIOU"
    word.each_char.with_index do |char, index|
        return index if vowel.include?(char)
    end

end



def convert_pig_latin(sent)
    result = []
    vowel = "aeiouAEIOU"


    sent.split(" ").each do |word|
        vf= first_vowel(word)
        if word.length < 3
            result << word
        elsif vowel.include?(word[0])
            if word == word.capitalize
                result << (word + "yay").capitalize
            else
                result << word + "yay"
            end
        else
            if word == word.capitalize
                result << (word[vf..-1] + word[0...vf] + "ay" ).capitalize
            else
                result << word[vf..-1] + word[0...vf] + "ay" 
            end
        end


    end
    result.join(" ")
end

def last_vowel(word)
    vowel = "aeiouAEIOU"
    result = 0
    word.each_char.with_index do |char, index|
        result = index if vowel.include?(char)
    end

    result
end

def reverberate(sent)
    result = []
    vowel = "aeiouAEIOU"

        sent.split(" ").each do |word|
            vf = last_vowel(word)
            if word.length < 3 
                result << word
            elsif vowel.include?(word[-1])
                if word == word.capitalize
                    result << (word + word).capitalize
                else
                    result << word + word
                end
            else
                if word == word.capitalize
                    result << (word + word[vf..-1]).capitalize
                else
                    result << word + word[vf..-1]
                end
            end


        end


    result.join(" ")
end

def disjunct_select(array, *procs)
    result = []
        array.each do |ele|
            procs.each do |prc|
                if prc.call(ele)
                    result << ele
                    break
                end
            end
        end

    result
end

def no_vowel?(word)
    vowel = "AEIOUaeiou"
    word.chars.each do |char|
        return false if vowel.include?(char)
    end
    true
end

def alternating_vowel(sentence)
    result = []
    vowel = "AEIOUaeiou"
    a = sentence.split(" ")
        (0...a.length).each do |i|
            chars = a[i].chars
            if no_vowel?(a[i])
                result << a[i]
            elsif i % 2 == 0
                chars.delete_at(first_vowel(a[i]))
                result << chars.join("")
            else
                chars.delete_at(last_vowel(a[i]))
                result << chars.join("")
            end

        end
    result.join(" ")
end

def silly_talk(sentence)
    result = []
    vowel = "AEIOUaeiou"

    sentence.split(" ").each do |word|
        if vowel.include?(word[-1])
            result << word + word[-1]
        else
            holder = []
            word.chars do |char|
                if vowel.include?(char)
                    holder << char + "b" + char.downcase
                else
                    holder << char
                end
            end
            result << holder.join("")
        end
    end
    result.join(" ")
end


def compress(string)
    result = []
    counter = 1
        (0...string.length).each do |i|
            if string[i] == string[i+1]
                counter += 1
            elsif (string[i] != string[i+1]) && counter == 1
                result << string[i]
            else
                result << string[i] + counter.to_s
                counter = 1
            end

        end
    result.join("")
end


p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
p compress("xxxaaasiemacoooooottttaaaam")