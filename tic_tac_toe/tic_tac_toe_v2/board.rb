class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end
    #attr_reader :grid

    def valid?(position)
        return false if position[0] < 0 || position[0] > @grid.length - 1
        return false if position[1] < 0 || position[1] > @grid[0].length - 1
        true
    end

    def empty?(position)
        return true if @grid[position[0]][position[1]] == "_"
        false
    end

    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise "There is something wrong"
        end
        @grid[position[0]][position[1]] = mark
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return row.all?{|i| i == mark}
        end
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            return col.all?{|i| i == mark}
        end
    end

    def first_diagonal(mark)
        i = 0
        while i < @grid.length
            if @grid[i][i] != mark
                return false
            end
            i += 1
        end
        true   
    end

    def second_diagonal(mark)
        i = 0
        while i < @grid.length
            if @grid[i][-i - 1] != mark
                return false
            end
            i += 1
        end
        true 
    end

    def win_diagonal?(mark)
        if first_diagonal(mark) || second_diagonal(mark)
            return true
        end
        false
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end


end
