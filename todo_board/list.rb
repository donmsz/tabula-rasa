require_relative "item.rb"
require "byebug"
class List

    def initialize(label)
        @label = label
        @items = []
    end
    attr_reader :label
    attr_writer :label


    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0
        return true if @items.length - 1 >= index
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1)
        return false if !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        return @items[0]
    end

    def print
        p "************************************"
        p "            Groceries               "
        p "************************************"
        p "Index | Item           | Deadline|  Done"
        p "************************************"
        @items.each_with_index do |element, index|
            p "#{index} |    #{element.title}      | #{element.deadline}|  #{element.done}"
        end
        p "************************************"
    end

    def print_full_item(index)
        return false if !valid_index?(index)
        p "************************************"
        p "#{@items[index].title}         | #{@items[index].deadline}"
        p "#{@items[index].description}   | #{@items[index].done}    "
        p "************************************"
    end

    def print_prority
        return false if !valid_index?(0)
        p "************************************"
        p "#{@items[0].title}         | #{@items[0].deadline}"
        p "#{@items[0].description}   | #{@items[0].done}    "
        p "************************************"
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        return false if index - amount < 0
        amount.times do |i|
            if index - amount >= 0
                placeholder = @items[index - i - 1]
                @items[index - i - 1] = @items[index - i]
                @items[index - i] = placeholder
            else
                break
            end
        end
        true
    end


    def down(index, amount = 1)
        return false if !valid_index?(index)
        return false if amount + index >= @items.length
        amount.times do |i|
            if index + i < @items.length
                placeholder = @items[index + i]
                @items[index + i] = @items[index + i + 1]
                @items[index + i + 1] = placeholder
            else
                break
            end
        end
        true
    end

    def sort_by_date!
        #debugger
        @items.sort_by!{ |item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.delete_if {|item| item.done == "[✓]"}
    end


end


