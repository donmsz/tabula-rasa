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

def conjunct_select(array, *procs)
    new_arr = []
    array.each do |ele|
        if procs.all?{|proc| proc.call(ele)}
            new_arr << ele
        end
    end
    new_arr
end

def conver(word)
    word_index = word.split("")
    vowel = "aeiou"

    word_index.each_with_index do |char,idx|
        if vowel.include?(char)
            return idx
        end
    end

end

def convert_pig_latin(sentence)
    result = []
    vowel = "aeiouAEIOU"
    sentence.split(" ").each do |word|
        if word.length < 3
            result << word
        elsif vowel.include?(word[0])
            if word == word.capitalize
                result << word.capitalize + "yay"
                else
                result << word + "yay"
            end
        else
            if word == word.capitalize
                result << word[conver(word)..-1].capitalize + word[0...conver(word)].downcase + "ay"
            else
                result << word[conver(word)..-1] + word[0...conver(word)].downcase + "ay"
            end
        end
    end
    
    result.join(" ")
end


# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:
# 
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
# 
# Examples

def last_conver(word)
    word_index = word.split("")
    vowel = "aeiou"
    result = 0
    word_index.each_with_index do |char,idx|
        if vowel.include?(char)
            result = idx
        end
    end
    result
end

def reverberate(sentence)
    result = []
    vowel = "aeiouAEIOU"
    sentence.split(" ").each do |word|
        if word.length < 3
            result << word
        elsif vowel.include?(word[-1])
            result << word + word.downcase
        else
            result << word + word[last_conver(word)..-1]
        end
    end
    result.join(" ")
end


def disjunct_select(array, *procs)
    new_arr = []
    array.each do |ele|
        if procs.any?{|proc| proc.call(ele)}
            new_arr << ele
        end
    end

    new_arr
end


def remove_first(word)
    first = conver(word)
    return word[0...first] + word[first+1..-1]
end

def remove_last(word)
    last = last_conver(word)
    return word[0...last] + word[last+1..-1]
end

def has_vovels(word)
    vowels = "aeiouAEIOU"
    word.each_char do |char|
        return true if vowels.include?(char)
    end
    false
end

def alternating_vowel(sentence)
    i = 0
    new_sent = []
    zdanie = sentence.split(" ")
    vowels = "aeiou"
    while i < zdanie.length
        if i % 2 == 0 && has_vovels(zdanie[i])
            new_sent << remove_first(zdanie[i])
        elsif i % 2 == 1 && has_vovels(zdanie[i])
            new_sent << remove_last(zdanie[i])
        else
            new_sent << zdanie[i]
        end
        i += 1
    end

    new_sent.join(" ")
end

def word_silly(word)
    chars = word.split("")
    result = []
    vovel = "aeiouAEIOU"
    chars.map do |char|
        if vovel.include?(char)
            result << char + "b" + char.downcase
        else
            result << char
        end
    end
    result.join("")
end

def silly_talk(sentence)
    words = sentence.split(" ")
    vovels = "aeiouAEIOU"
    result = []
    words.each do |word|
        if vovels.include?(word[-1])
            result << word + word[-1]
        else
            result << word_silly(word)
        end
    end
    result.join(" ")
end
#
#Write a method compress that accepts a string as an argument. 
#The method should return a "compressed" version of the string where streaks of consecutive letters 
#are translated to a single appearance of the letter followed by the number of times it appears in the streak. 
#If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.
#

def compress(word)
    result = []
    i = 0
    counter = 1
    while i < word.length
        if word[i] == word[i+1]
            counter += 1
        else
            if counter == 1
                result << word[i]
            else
            result << word[i] + counter.to_s
            counter = 1
            end
        end
        i += 1
    end
    result.join("")
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"



