
def my_reject(array, block)
    new_arr = []
    array.each do |ele|
        if !block.call(ele)
            new_arr << ele
        end
    end
    new_arr
end