class Board


    def initialize
        @grid = Array.new (3) {Array.new(3, "_")}

    end

    def valid?(position)
        return false if (position[0] < 0) || (position[0] > @grid.length - 1)
        return false if (position[1] < 0) || (position[1] > @grid.length - 1) 
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
            raise "Invalid position or mark"
        end
    end

    def print
        p "---------------"
        @grid.each do |row|
            p row
        end
        p "---------------"
        true
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? {|check| check == mark}
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            return true if row.all? {|check| check == mark}
        end
        false
    end

    def win_diagonal?(mark)
        return (0...@grid.length).collect {|i| @grid[i][i]}.all? {|check| check == mark} || 
        (0...@grid.length).collect {|i| @grid[i][-i - 1]}.all? {|check| check == mark}
    end
    
    def win?(mark)
        return win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|check| check == "_"}
    end


end