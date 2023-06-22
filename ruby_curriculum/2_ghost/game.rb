require "byebug"

class Game
    def initialize(player_1, player_2)
        @player_1 = Player.new(player_1)
        @player_2 = Player.new(player_2)
        @fragment = ""
        @current_player = @player_1
        @dictionary = Set.new(File.read("dictionary.txt").split("\r\n"))
    end

    attr_reader :fragment, :dictionary, :current_player
    attr_writer :fragment

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def valid_fragment?(frag)
        @dictionary.each do |word|
            if word.include?(frag)
                return true
            end
        end
        false
    end

    def valid_word?(word)
        if @dictionary.include?(word)
            return true
        end
        false
    end

    

    #debugger

    def play
        while @fragment 
        end
    end



end


