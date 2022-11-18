require_relative "list.rb"
require_relative "item.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "Enter a command: "
        command, *args = gets.chomp.split(' ')

        case command
        when 'mktodo'
            @list.add_item(*args)
            return true
        when 'up' 
            @list.up(*args)
            return true
        when 'down'
            @list.down(*args)
            return true
        when 'swap'
            @list.swap(*args)
            return true
        when 'toggle'
            @list.toggle_item(*args)
            return true
        when 'sort'
            @list.sort_by_date!
            return true
        when 'priority'
            @list.print_priority
            return true
        when 'print'
            args.length == 0 ? @list.print : @list.print_item_full(*args)
            return true
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
            puts "\n"
            return true
        end
    end

    def run
        while get_command
            
        end
    end
end