class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length >= @capacity
        false
    end

    def board_passenger(passenger)
        if !full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        passanger_names = []
        @passengers.each do |ele|
            passanger_names << ele.name
        end
        passanger_names
    end

    def [](index) 
        @passengers[index]
    end

    def <<(passanger)
        board_passenger(passanger)

    end


end