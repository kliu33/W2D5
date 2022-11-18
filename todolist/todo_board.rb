require_relative "list.rb"
require_relative "item.rb"

class TodoBoard

    def initialize(label)
        @lists = Hash.new
    end

    def get_command
        print "Enter a command: "
        command, *args = gets.chomp.split(' ')

        case command

        when 'mklist'
            self.make_new_list(*args)
            return true
        when 'ls'
            self.print_labels
            return true
        when 'showall'
            self.showall
            return true
        when 'mktodo'
            @lists[args[0]].add_item(args[1],args[2])
            return true
        when 'up' 
            @lists[args[0]].up(args[1..-1])
            return true
        when 'down'
            @lists[args[0]].down(args[1..-1])
            return true
        when 'swap'
            @lists[args[0]].swag(args[1],args[2])
            return true
        when 'toggle'
            @lists[args[0]].toggle_item(args[1])
            return true
        when 'sort'
            @lists[*args].sort_by_date!
            return true
        when 'priority'
            @lists[*args].print_priority
            return true
        when 'rm'
            @lists[args[0]].remove_item(args[1])
            return true
        when 'purge'
            @lists[*args].purge
            return true
        when 'print'
            args.length == 1 ? @lists[args[0]].print : @lists[args[0]].print_item_full(args[1])
            return true
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
            puts "\n"
            return true
        end
    end

    def make_new_list(label)
        @lists[label] = List.new(label)
    end

    def print_labels
        @lists.keys.each do |key|
            puts key
        end
    end

    def showall
        @lists.each do |k,v|
            v.print
        end
    end

    def run
        while get_command
            
        end
    end
end