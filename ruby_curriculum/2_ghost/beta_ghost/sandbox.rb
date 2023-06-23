require "byebug"

    #attr_reader :words

    #words = Hash.new {|hash,key| hash[key] = []}
    #    file = File.open("dictionary.txt")
    #    File.readlines(file).each do |word|
    #        #debugger
    #        wo = word.gsub(/[\r\n]/,'')
    #        words[wo.length] << wo
    #    end

    dictionary = Set.new(File.read("dictionary.txt").split("\r\n"))
    p dictionary.include?("bold")
    p dictionary.include?("zombie")
    p dictionary.include?("winding")
    



