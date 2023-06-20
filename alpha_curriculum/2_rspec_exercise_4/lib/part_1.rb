def my_reject(array, &prc)
    new_arr = []
    array.each do |ele|
        if !prc.call(ele)
            new_arr << ele
        end
    end
    new_arr 

end

def my_one?(array, &prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count == 1
end


def hash_select(hash, &prc)

    h = Hash.new
    hash.each do |k,v|
        if prc.call(k,v)
            h[k] = hash[k]  
        end
    end
    h
end

def xor_select(array, prc, block)
    new_arr = []
        array.each do |ele|
            if (prc.call(ele) && block.call(ele)) || (!prc.call(ele) && !block.call(ele))           
                true
            else
                new_arr << ele
            end
        end
    new_arr
end

def proc_count(value, array)
    result = 0
    array.each do |prc|
        result += 1 if prc.call(value)
    end
    result
end