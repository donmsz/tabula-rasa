require "byebug"
def some?(array, &prc)
    array.each do |element|
        return true if prc.call(element)
    end
    false
end

def exactly?(array, number, &prc)
    counter = 0
    array.each do |ele|
        counter += 1 if prc.call(ele)
    end
    counter == number
end

def filter_out(array, &prc)
    result = []
    array.each do |ele|
        result << ele if !prc.call(ele)
    end
    result
end

def at_least?(array, number, &prc)
    counter = 0
    array.each do |ele|
        counter += 1 if prc.call(ele)
    end
    counter >= number
end

def every?(array, &prc) 
    array.each do |ele|
        return false if !prc.call(ele)
    end
    true
end

def at_most?(array, number, &prc)
    counter = 0
    array.each do |ele|
        counter += 1 if prc.call(ele)
    end
    counter <= number
end

def first_index(array, &prc)
    
    array.each_with_index do |element, index|
        return index if prc.call(element)
    end
    nil
end

def xnor_select(array, block, prc)

    result = []
    array.each do |ele|
        if !prc.call(ele) && !block.call(ele) || prc.call(ele) && block.call(ele)
            result << ele
        end

    end

    result 
end

def filter_out!(array, &prc)
    i = 0
    while i < array.length
        if prc.call(array[i])
            array.delete_at(i)
            i -= 1
        end
        i += 1
    end
    array
end

def multi_map(array, n = 1 ,&prc)
    result = []
        array.each do |ele|
            n.times do
                ele = prc.call(ele)
            end
            result << ele
        end
    result
end

def proctition(array, &prc)
    first = []
    last = []
    array.each do |ele|
        if prc.call(ele)
            first << ele
        else
            last << ele
        end
    end
    first + last
end



def selected_map!(array, prc, block)
    array.map! do |ele|
        if prc.call(ele)
            ele = block.call(ele)
        else
            ele
        end
    end
    nil
end

def chain_map(val, procs)

    procs.each do |prc|
        val = prc.call(val)
    end
    val

end


def proc_suffix(sent, hasz)
    result = []

    sent.split(" ").map do |word|
        holder = word
        hasz.each do |key,value|
            if key.call(word)
                holder += value
            end
        end
        result << holder

    end

    result.join(" ")
end


def proctition_platinum(array, *procs)

    ha = Hash.new { |hash,key| hash[key] = []}


    i = 0

    procs.each_with_index do |prc,index|
        while i < array.length
            if prc.call(array[i])
                ha[index + 1] << array[i]
                array.delete(array[i])
                i = 0
            else
                i += 1
            end
        end
        i = 0
    end
    ha
end

def procipher(sentence, hash)
    result = []
    sentence.split(" ").each do |word|
        holder = word
        hash.each do |key,value|
            if key.call(word)
                holder = value.call(holder)
            end
        end
        result << holder
    end
    result.join(" ")
end


def picky_procipher(sentence, hash)
    result = []

        sentence.split(" ").each do |word|
            holder = word
            hash.each do |key,value|
                if key.call(word)
                    holder = value.call(holder)
                    break
                end
            end
            result << holder
        end

    result.join(" ")
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p picky_procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias what!???"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw"

p picky_procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p picky_procipher('STOP that taxi!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? !ixat"