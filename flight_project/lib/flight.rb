class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pass)
        if !self.full?
            if pass.has_flight?(@flight_number)
                @passengers << pass
            end
        end
    end

    def list_passengers
        @passengers.map {|pass| pass.name}
    end

    def [](idx)
        @passengers[idx]
    end 

    def <<(pass)
        board_passenger(pass)
    end
end 