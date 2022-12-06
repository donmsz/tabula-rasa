require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_one = HumanPlayer.new(player_1_mark)
        @player_two = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_one
    end

    def switch_turn
        if @current_player == @player_one
            @current_player = @player_two
        else
            @current_player = @player_one
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position,@current_player.mark)
            if @board.win?(@current_player.mark)
                p "Victory ! #{@current_player.mark} won the Game"
                return true
            else
                self.switch_turn
            end
        end
        p "DRAW"

    end

end