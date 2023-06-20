require_relative "list.rb"
require "byebug"
class TodoBoard


    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
            true
        when 'up'
            arr = args.map {|item| item = item.to_i}
            @list.up(arr[0],*arr[1])
            true
        when 'down'
            arr = args.map {|item| item = item.to_i}
            @list.down(arr[0],*arr[1])
            true
        when 'swap'
            @list.swap(args[0].to_i, args[1].to_i)
            true
        when 'sort'
            @list.sort_by_date!
            true
        when 'priority'
            @list.print_prority
            true
        when 'print'
            if args.empty?
                @list.print
            else
                @list.print_full_item(args[0].to_i)
            end
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