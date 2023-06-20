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


    def initialize(title, deadline, description)
        raise "raises error due to invalid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description




    end




end


p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
p Item.new(
    'Buy Cheese',
    '2019-10-21',
    'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
)
p Item.new(
    'Fix checkout page',
    '10-25-2019',
    'The font is too small.'
)