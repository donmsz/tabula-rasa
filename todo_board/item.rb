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
        @title =title
        @deadline = deadline
        @description = description

        


    end




end


p Item.valid_date?('2019-10-25') # true
p Item.valid_date?('1912-06-23') # true
p Item.valid_date?('2018-13-20') # false
p Item.valid_date?('2018-12-32') # false
p Item.valid_date?('10-25-2019') # false