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


p vowel_count("siema")