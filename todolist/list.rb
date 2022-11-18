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
        idx = index.to_i
        return false if idx < 0 || idx > (size - 1)
        true
    end 

    def swap(index_1, index_2)
        return false if !valid_index?(index_1.to_i) || !valid_index?(index_2.to_i)
        @items[index_1.to_i] , @items[index_2.to_i] = @items[index_2.to_i] , @items[index_1.to_i]
        true
    end

    def [](index)
        return nil if !valid_index?(index.to_i)
        @items[index.to_i]
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
            puts "#{@items[index.to_i].title.ljust(25)} #{@items[index.to_i].deadline}"
            puts @items[index.to_i].description
            puts "----------------------------------------"
        end
    end

    def print_priority
        print_item_full(0)
    end

    def up(index, amount = 1)
        idx = index.to_i
        return false if !valid_index?(idx)
        amount.to_i.times do 
            if idx != 0
                swap(idx, idx-1)
                idx -= 1
            end
        end
        true
    end

    def down(index, amount = 1)
        idx = index.to_i
        return false if !valid_index?(idx)
        amount.to_i.times do 
            if idx != size - 1
                swap(idx, idx+1)
                idx += 1
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