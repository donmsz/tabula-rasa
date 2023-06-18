class ComputerPlayer

    def initialize(mark)
        @mark = mark
    end
    def mark
        @mark
    end

    def get_position(legal_positions)
        result = legal_positions.sample
        p "Computer #{@mark} pick #{result[0]} #{result[1]} as computer position" 
        result
    end



end