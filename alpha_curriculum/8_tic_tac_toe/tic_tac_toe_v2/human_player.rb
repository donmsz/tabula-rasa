class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end




    def get_position
        p "it's #{mark} move"
        p "Whats your move, please use two numbers with space in between"
        position = gets.chomp.split(" ").map(&:to_i)
        if position.length > 2
            raise "sorry, that was invalid, too many input"
            return false
        elsif position.length < 2
            raise "sorry, that was invalid, not enough input"
            return false
        end
        position
    end
end