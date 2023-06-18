class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end




    def get_position(legal_positions)
        p "it's #{mark} move"
        p "enter two numbers representing a position in the format `row col`"
        position = gets.chomp.split(" ").map(&:to_i)
        while !legal_positions.include?(position)
            p "sorry, that was invalid"
            p "it's #{mark} move"
            p "enter two numbers representing a position in the format `row col`"
            position = gets.chomp.split(" ").map(&:to_i)
        end

        # if position.length > 2
        #     raise "sorry, that was invalid, too many input"
        #     return false
        # elsif position.length < 2
        #     raise "sorry, that was invalid, not enough input"
        #     return false
        # end
        position
    end
end