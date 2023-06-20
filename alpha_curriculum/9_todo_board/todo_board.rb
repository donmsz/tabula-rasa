require_relative "list.rb"
require "byebug"
class TodoBoard


    def initialize
        @list = Hash.new
    end

    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist' # make a new list with the given label
            @list[label] = List.new(label)
            true
        when 'mktodo' # add a new item to the specified list with the given information
            @list[label].add_item(*args)
            true
        when 'up' #move the specified item higher on the given list
            arr = args.map {|item| item = item.to_i}
            @list.up(arr[0],*arr[1])
            true
        when 'down' #move the specified item higher on the given list
            arr = args.map {|item| item = item.to_i}
            @list.down(arr[0],*arr[1])
            true
        when 'ls' # print the labels of all lists
            @list.each_key {|key| p key.to_sym}
            true
        when 'swap' #swap the positions of the specified items on the given list
            @list.swap(args[0].to_i, args[1].to_i)
            true
        when 'sort' #sort the given list by deadline
            @list.sort_by_date!
            true
        when 'showall'
            @list.each_key {|key| @list[key].print}
            true
        when 'priority' #print the all information for the item at the top of the given list
            @list.print_prority
            true
        when 'print'#print all items of the given list if index is not provided
            if args.empty?
                @list[label].print
            else#print the specific item of the given list if index is provided
                @list[label].print_full_item(args[0].to_i)
            end
            true
        when 'purge' #remove all "done" items on the given list
            @list[label].purge
            true
        when 'toggle' #toggle "done" for the specified item on the given list
            @list[label].toggle_item(args[0].to_i)
            true
        when 'rm' # remove the specified item on the given list
            @list[label].remove_item(args[0].to_i)
            true
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end

    def run 
        while get_command
        end
    end


end

my_board = TodoBoard.new
my_board.run