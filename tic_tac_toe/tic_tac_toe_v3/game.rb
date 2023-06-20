require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"
require "byebug"

class Game


    def initialize(board_size, players_hash)
        @players_array = []

        players_hash.each do |key, value|
            if value == true
                @players_array << ComputerPlayer.new(key)
            else
                @players_array << HumanPlayer.new(key)
            end
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
            legal = @board.legal_positions
            @board.print
            position = @current_player.get_position(legal)
            
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory #{@current_player.mark}"
                return
            else
                switch_turn
            end
        end
        @board.print
        puts "no more empty positions, its a draw"   
    end

end