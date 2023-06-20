require_relative "board.rb"
require_relative "human_player.rb"
#require "byebug"

class Game
    

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(player_1_mark)
        @player_2_mark = HumanPlayer.new(player_2_mark)
        @current_player = @player_1_mark
        @board = Board.new

    end

    def switch_turn
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            #debugger
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory #{@current_player.mark}"
                return
            else
                switch_turn
            end
        end
        puts "no more empty positions, its a draw"
    end

end