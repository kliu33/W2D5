class Item

    attr_reader :deadline, :track
    attr_accessor :title, :description

    def self.valid_date?(date)
        parts = date.split("-")
        return false if parts[0].length != 4
        return false if parts[1].length != 2
        return false if parts[2].length != 2

        digs = "1234567890"
        parts.each do |part|
            part.each_char do |ele|
                return false if !digs.include?(ele)
            end
        end

        return false if parts[1].to_i > 12 || parts[1].to_i < 1
        return false if parts[2].to_i > 31 || parts[1].to_i < 1

        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        @track = false
        raise "deadline is not valid" unless self.class.valid_date?(deadline)
        @deadline = deadline
    end

    def deadline=(deadline)
        raise "deadline is not valid" unless self.class.valid_date?(deadline)
        @deadline = deadline
    end 

    def toggle
        if @track == true
            @track = false
        else
            @track = true
        end
    end
end 