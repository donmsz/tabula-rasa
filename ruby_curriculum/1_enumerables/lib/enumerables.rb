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

    def my_rotate(rotations = 1)
        arr = self
            if rotations > 0
                rotations.times do 
                    #debugger
                    holder = arr.slice(0)
                    arr.slice!(0)
                    arr << holder
                end
            else
                (rotations * -1).times do        
                    holder = arr.slice(3)
                    arr.slice!(3)
                    arr.unshift(holder)
                end
            end
        arr
    end

    def my_join(separator = "")
        arr = []
        self.my_each {|ele| arr << ele + separator}
        arr.join("")
    end

    def my_reverse

        self.reverse


    end


   
end


p [ 1 ].my_reverse               #=> [1]
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]