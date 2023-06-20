class Flight
    require "byebug"
    require "passenger"
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if !full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger 
            end 
        end
    end

    def list_passengers
        names = []
            passengers.each do |person|
                names << person.name
            end
        names
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
   

end