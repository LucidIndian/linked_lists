# https://www.theodinproject.com/lessons/ruby-linked-lists

class Node
  
  attr_accessor :value, :next_node
  
  def initialize(value = nil) # set as nil by default
    @value = value
    @next_node = nil # set as nil by default
  end

end

class LinkedList
  
  attr_reader :head

  def initialize(node = nil) # empty list
    @head = node # pointer to the first node
  end

  def append(value)
    if @head.nil? # if there's nothing there (empty list) 
      @head = Node.new(value)
    else # there's something in the list
      # go to the end
      current_node = @head # start at the beginning
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil? # if there's nothing there (empty list) 
      @head = Node.new(value)
    else
      node = Node.new(value)
      node.next_node = @head # point new node to head (old first) before changing head
      @head = node # set new head
    end  
  end

  def size
    return 0 while @head == nil
    i = 1 # iterator
    current_node = @head # start at the beginning
    until current_node.next_node.nil?
      current_node = current_node.next_node
      i += 1
    end 
    i
  end

  def head
    @head
  end

  def tail
    current_node = @head # start at the beginning
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end 
    current_node
  end

  def at(index)
    current_node = @head # start at the beginning
    traverse_index = 0
    until traverse_index == index
      current_node = current_node.next_node
      traverse_index += 1
    end 
    current_node
  end

  def pop
    current_node = @head # start at the beginning
    tail = self.tail
    current_node = current_node.next_node until current_node.next_node == tail
    current_node.next_node = nil # change pointer on 2nd last item
    tail = nil # set last item to nil   
  end

  def contains?(input)
    current_node = @head # start at the beginning
    until current_node.nil?
      return true if current_node.value == input
      current_node = current_node.next_node
    end

    false
  end

  def find(input)
    #  returns the index of the node containing input, or nil if not found.
    current_node = @head # start at the beginning
    traverse_index = 0
    until current_node.nil?
      return traverse_index if current_node.value == input
      current_node = current_node.next_node
      traverse_index += 1
    end 
    nil
  end

  def to_s
    # FORMAT: ( value ) -> ( value ) -> ( value ) -> nil
    current_node = @head # start at the beginning
    string = ''
    until current_node.nil?
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end  
      string += ' nil '
      string
  end

end

llist = LinkedList.new
llist.append(130)
llist.append("thirteen")
llist.append(13)
llist.append(6)
llist.prepend(900)
puts "llist size is #{llist.size}"
puts "llist head is #{llist.head}" 
puts "llist tail is #{llist.tail}" 
puts "llist at index 1 is #{llist.at(1)}"
llist.pop
puts "Removed last item"
puts "llist size is #{llist.size}"
puts "llist contains 9? #{llist.contains?(9)}"
puts "llist index of 900 is #{llist.find(900)}"
puts "llist as a string is #{llist.to_s}"
p llist
