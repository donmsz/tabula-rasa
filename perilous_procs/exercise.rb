require "byebug"
def some?(array, &prc)
    array.each do |ele|
        return true if prc.call(ele)
    end
    false
end

def exactly?(array, n, &prc)
    count = 0
    array.each do |ele|
        count +=1 if prc.call(ele)
    end
    count == n
end

def filter_out(array, &prc)
    arr = []
    array.each do |ele|
        arr << ele if !prc.call(ele)
    end
    arr
end

def at_least?(array, n, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
    end
    count >= n
end

def every?(array, &prc)
    array.each do |ele|
        return false if !prc.call(ele)
    end
    true
end

def at_most?(array, n, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
    end
    count <= n
end


def first_index(array, &prc)
    array.each_with_index do |ele,idx|
        return idx if prc.call(ele)
    end
    nil
end

def xnor_select(array, block, prc)
    arr = []
    array.each do |ele|
        arr << ele if prc.call(ele) && block.call(ele) || !prc.call(ele) && !block.call(ele)
    end
    arr
end

def filter_out!(array, &prc)
    array.delete_if {|ele| prc.call(ele)}
end

def multi_map(array, n = 1, &prc)
    arr = []
        array.each do |ele|
            n.times do 
                ele = prc.call(ele)
            end
            arr << ele
        end
    arr
end

def proctition(array, &prc)
    t = []
    f = []
    array.each do |ele|
        if prc.call(ele)
            t << ele
        else
            f << ele
        end
    end
    t + f
end

def selected_map!(array, block, prc)
    array.map! do |ele|
        if block.call(ele)
            ele = prc.call(ele)
        else
            ele
        end
    end
    nil
end

def chain_map(ele, procs)
    procs.each do |prc|
        ele = prc.call(ele)
    end
    ele
end

def proc_suffix(sent, hash)
    s = []
    sent.split(" ").each do |word|
        r = word
        hash.each_pair do |key, value|
            if key.call(word)
                r += value
            end
        end
        s << r
    end

    s.join(" ")
end

def proctition_platinum(array,*procs)
    hash = Hash.new { |hash,key| hash[key] = []}
    array.each do |ele|
        procs.each_with_index do |prc,idx|
            if prc.call(ele)
                hash[idx+1] << ele
                break
            end
        end
    end
    hash.sort
end


def procipher(sent,hasz)
    sentence = []
    sent.split(" ").each do |word|
        #byebug
        placeholder = word
        hasz.each_key do |key|
            if key.call(word)
                placeholder = hasz[key].call(placeholder)
            end
        end
        sentence << placeholder
    end
    sentence.join(" ")
end

def picky_procipher()


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