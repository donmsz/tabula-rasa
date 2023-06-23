require_relative "game.rb"
class Player

    attr_reader :player_name
    def initialize(player_name)
        @player_name = player_name
    end

    def name
        @player_name
    end

    

    def prompt_guess
        p "it's #{@player_name} move"
        p "enter one letter"
    end

    def guessed_letter
        gets.chomp.downcase
    end


    def alert_invalid_guess
        puts 'Fragment must form a valid English word! :)'
    end



end