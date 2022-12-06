require "byebug"
class Passenger 
    def initialize(name)
        @name = name
        @flight_numbers = []
    end
    attr_reader :name
    def has_flight?(flight_number)
        return @flight_numbers.any?{|nr| nr.upcase == flight_number.upcase}
    end

    def add_flight(flight_number)
        @flight_numbers << flight_number.upcase if !has_flight?(flight_number)
    end
end



