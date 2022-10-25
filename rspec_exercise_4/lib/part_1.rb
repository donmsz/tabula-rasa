def my_reject(array, &prc)
    new_array = []
    array.each do |i|
        new_array << i if !prc.call(i)
    end
    new_array
end

def my_one?(array, &prc)
    count = 0
    array.each do |i|
        count += 1 if prc.call(i)
    end
    count == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |k, v|
        if prc.call(k,v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(array, prc, block)
    new_arr = []
    array.each do |i|
        if !prc.call(i) && block.call(i) || prc.call(i) && !block.call(i)
            new_arr << i
        end
    end
    new_arr
end

def proc_count(value, array)
    count = 0
    array.each do |prc|
        count += 1 if prc.call(value)
    end
    count
end