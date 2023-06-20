class Item
    def self.valid_date?(date_string)
        date = date_string.split("-")
        return false if date[0].length != 4
        return false if date[1].length != 2
        return false if date[2].length != 2

        return false if date[0].to_i < 1912 || date[0].to_i > 2023
        return false if date[1].to_i < 1 || date[1].to_i > 12
        return false if date[2].to_i < 1 || date[2].to_i > 31
        true
    end

    attr_reader :title, :deadline, :description, :done
    attr_writer :title, :description

    def initialize(title, deadline, description)
        raise "raises error due to invalid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = "[ ]"

    end

    def deadline=(new_deadline)
        raise "raises error due to invalid date" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def toggle
        @done = (@done == "[ ]") ? "[✓]" : "[ ]"
    end
end
