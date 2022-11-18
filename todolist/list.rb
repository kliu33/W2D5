require_relative "item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < 0 || index > size - 1
            p "invalid index #{index}"
            return false 
        end
        true
    end 

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1] , @items[index_2] = @items[index_2] , @items[index_1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "Index | Item           | Deadline"
        @items.each_with_index do |item, idx|
            puts "#{idx}     | #{item.title.ljust(12)}   | #{item.deadline}"
        end
        puts "\n"
    end

    def print_item_full(index)
        if valid_index?(index)
            puts "----------------------------------------"
            puts "#{@items[index].title.ljust(25)} #{@items[index].deadline}"
            puts @items[index].description
            puts "----------------------------------------"
        end
    end

    def print_priority
        print_item_full(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        amount.times do 
            if index != 0
                swap(index, index-1)
                index -= 1
            end
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        amount.times do 
            if index != size - 1
                swap(index, index+1)
                index += 1
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
end

# my_list = List.new('Groceries')
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('toothpaste', '2019-10-25')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
# my_list.print
# my_list.sort_by_date!
# my_list.print