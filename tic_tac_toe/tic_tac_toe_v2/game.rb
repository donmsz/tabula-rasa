require_relative "board.rb"
require_relative "human_player.rb"
require "byebug"

class Game


    def initialize(board_size, *players)
        @players_array = []
        players.each_with_index do |gracz, index|
            #debugger
            players[index] = HumanPlayer.new(gracz)
            @players_array << players[index]
        end
        @players_array
        @current_player = @players_array[0]
        @board = Board.new(board_size)

    end

    def switch_turn
        @players_array = @players_array.rotate
        @current_player = @players_array[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            
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