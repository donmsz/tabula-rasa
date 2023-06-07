class Human

    attr_reader :mark


    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Please input mark position."
        gets.chomp

    end

end