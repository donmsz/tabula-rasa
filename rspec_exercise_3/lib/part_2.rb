require "byebug"
def element_count(array)
    h = Hash.new {|hash, key| hash = 0 }

    array.each do |ele|
        h[ele] += 1
    end
    h
end


def char_replace!(string, hash)
    (0..string.length).each do |i|
        if hash.has_key?(string[i])
            string[i] = hash[string[i]]
        end
    end
    string
end


def product_inject(numbers)
    numbers.inject {|product, n| product * n}
end