class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(num)
        @flight_numbers.include?(num.upcase)
    end

    def add_flight(num)
        if !has_flight?(num)
            @flight_numbers << num.upcase
        end
    end

end 