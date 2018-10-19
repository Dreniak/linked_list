class Node
    attr_accessor :next_node, :value

    def initialize(value = nil, next_node = nil)
        @value = value 
        @next_node = next_node
    end

end

class LinkedList
    
    def initialize
        @head = nil
        @tail = @head
        @length = 0
    end

    def append(value)
        if @head.nil? 
            @head = Node.new(value) 
            @tail = @head
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node
        end
        @length += 1
    end
    
    def prepend(value)
        @head = Node.new(value, @head)
        @tail = @head if @tail.nil?
        @length += 1
    end

    def size
        @length
    end

    def head
        @head.value
    end

    def tail
        @tail.value
    end

    def at(index)
        pointer = @head
        if index < 0 || index > @length - 1
            return nil
        end
        index.times do
            pointer = pointer.next_node
        end
        pointer.value
    end

    def pop
        return nil if @head.nil?
        pointer = @head
        until pointer.next_node == @tail
            pointer = pointer.next_node
        end
        pointer.next_node = nil
        @tail = pointer
        @length -= 1
    end

	def contains?(data)
		pointer = @head
		until pointer == nil
			return true if pointer.value == data
            pointer = pointer.next_node
		end
		false
    end
    
    def find(data)
        pointer = @head
        index = 0
        until pointer == nil
            return index if pointer.value == data
            pointer = pointer.next_node
            index += 1
        end
        nil
    end

    def to_s
        pointer = @head
        result = ""
        until pointer == nil
            result << "( #{(pointer.value)} ) -> "
            pointer = pointer.next_node
        end
        result << "nil"
    end

end