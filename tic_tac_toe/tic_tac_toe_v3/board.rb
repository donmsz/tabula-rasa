class Board
    require "byebug"
    def initialize(size)
        @grid = Array.new(size) {Array.new(size,"_")}
    end

    def grid
        @grid
    end

    def valid?(position)
        if (position[0] < 0) || (position[0] > @grid.length - 1) || (position[1] < 0) || (position[1] > @grid.length - 1)
            return false
        end
        true
    end

    def empty?(position)
        if valid?(position)
            return true if @grid[position[0]][position[1]] == "_"
        end
        false
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "co Ty robisz?"
        end
    end

    def print
        @grid.each do |row|
            p row
            p "__________________________________________"
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all?{|ele| ele == mark}
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            return true if col.all?{|ele| ele == mark}
        end
        false
    end

    def win_diagonal?(mark)
        left = true
        right = true
        (0...@grid.length).each do |i|
            if @grid[i][i] != mark
                left = false
            end
            if @grid[i][-i - 1] != mark
                right = false
            end
        end
        left || right
    end

    def win?(mark)
        return win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |position|
                return true if position == "_"
            end
        end
        false
    end

    def legal_positions
        legal = []
        @grid.each_with_index do |row,index|
            #debugger
            row.each_with_index do |ele,idx|
                if ele == "_"
                    legal << [index, idx]
                end
            end
        end
        legal
    end

end