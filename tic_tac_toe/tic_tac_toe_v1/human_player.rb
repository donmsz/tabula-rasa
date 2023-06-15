class Human
    attr_reader mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "siemka podaj pozycje player #{mark_value}"
        input = gets.chomp
        position = [input[0],input[2]]





        #This method should prompt and allow the user to enter a valid row col position. We recommend that you ask the user to enter the position as two numbers with a space between them. 
        #Your method should return their entered position as an array of the form [row, col] so that it is compatible with the design of our previous Board methods. 
        #For usability, raise an error when they fail to enter a position in the specified format, such as if they only enter a single number, use letters, or have too many spaces.
        # No need to verify if the position they entered is a valid position in this class. That validation requires knowledge of the board and we want to keep our concerns separated. 
        #Besides, you previously implemented that logic in Board#valid? and Board#empty?.
        # It's also helpful if you state the player's mark when asking them to enter a move, so we know whose turn it is.



    end
end