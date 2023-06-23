require "byebug"
require "set"
require_relative "player.rb"
require_relative "play.rb"

class Game

    attr_reader :fragment, :dictionary, :current_player, :game_over
    attr_writer :fragment, :game_over


    def initialize(player_1, player_2)
        # @player_1 = Player.new(player_1)
        # @player_2 = Player.new(player_2)
        @player_1 = player_1
        @player_2 = player_2
        @fragment = ""
        @current_player = @player_1
        @dictionary = Set.new(File.read("dictionary.txt").split("\r\n"))
        @game_over = false
    end

    
    # switch turn
    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    #if fragment of a word is in dictionary then its ok
    def valid_fragment?(frag)
        @dictionary.each do |word|
            if word.include?(frag)
                return true
            end
        end
        false
    end
    # if fragment equals word return true
    def valid_word?(word)
        if @dictionary.include?(word)
            return true
        end
        false
    end
    # if fragment plus letter is in dictionary
    def valid_letter?(letter)
        check = @fragment + letter
        if valid_fragment?(check)
            p check
            return true
        else
            return false
        end
    end
    # adds letter to fragment
    def add_letter(letter)
        @fragment += letter

    end

    def play_round
        while !game_over
            #Display the current word and prompt the current player for a letter
            p "Current word: #{@fragment}"
            p "Player: #{@current_player}, enter a letter"
            letter = gets.chomp
            #// Add the letter to the current word
            while !valid_letter?(letter)
                p "sorry, that was invalid"
                p "Player: #{@current_player}"
                p "enter different letter`"
                letter = gets.chomp
            end
            @fragment += letter
            #// Check if the current word is a valid word
            if valid_word?(@fragment)
                #// The current player has lost
                p "Player #{@current_player} loses!"
                @game_over = true
            else
                #// Switch to the next player
                switch_turn
            end
        end
        p "***************"
        p @fragment
        p "Game_over!"

    end


end

g = Game.new(:X, :O)
g.play_round

