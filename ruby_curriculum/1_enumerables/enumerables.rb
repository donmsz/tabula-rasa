require "byebug"
class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each {|ele| arr << ele if prc.call(ele)}
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each {|ele| arr << ele if !prc.call(ele)}
        arr
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.my_each {|ele| return false if !prc.call(ele)}
        true
    end

    def my_flatten

        flattened = []
        self.my_each do |ele|
            if !ele.is_a?(Array)
                flattened << ele
            else
                flattened += ele.my_flatten
            end
        end
        flattened
    end

    def my_zip(*args)
        arr = [] # create new array
        self.length.times do |idx| # self times so if [1,2] do it 2 times
            #debugger
            sub_arr = Array.new(1, self[idx])   # holder array that you add elements
            args.each do |ele|  # every argument array 
                sub_arr << ele[idx] # add to subarray - argument array at inndex
            end
            arr << sub_arr  #add arrays to self
        end
        arr
    end



end



a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]