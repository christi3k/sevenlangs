# NOTES
a = [5, 4, 3, 1]

# sort sorts the array
puts a.sort

#any? returns true if condition is true for any elements
puts a.any? { |x| x > 6 }

#all? returns true if condition is true for all elements
puts a.all? { |x| x > 0 }

# collect and map apply a function to a set of elements and return the result
puts a.collect { |x| x * 2 }

# select and find return all elements that match a condition

# selects even numbers
puts a.select { |x| x % 2 == 0}

# selects odd numbers
puts a.select { |x| x % 2 == 1}

# inject takes executes a block of code on each element in collection
# it takes two arguments: 1st is prev result of code block, 2nd is 
# next element in the list
# you can specify initial value as arg to inject, otherwise it will use first
# element in list as the init value
a.inject(0) do |sum,i|
    puts "sum: #{sum}   i: #{i}   sum + i:  #{sum + i}"
    sum + i
end

# is the same as:
puts a.inject {|sum, i| sum + i}

# EXERCIES

# File operations: to block or no block?
# you can open a file as such:
file = File.new("test.txt", "r")
# do stuff
file.close

# or by using a block:
File.open("test.txt", "r") do |file|
    # process the file
end

# the last method above automatically closes the file at the end of the block
# it also has better exception handling: the file is closed before the exeption
# is propagated


# EXERCISES

#Print the contents of an array of sixteen numbers, four numbers
#at a time, using just each. Now, do the same with each_slice in
#Enumerable.

# first with each
array = (1..16).to_a
array.each do |value|
    index = array.index(value)
    puts array[(index..index+3)].to_s if index % 4 == 0
end

# now with each_slice
(1..16).each_slice(4) { |arr| p arr }

# improvements to tree class
class Tree
  attr_accessor :children, :node_name
  
  def initialize(tree)
      # get the key of first node
      @node_name = tree.keys.first
      # initialize children array
      @children = []
      # load children with instances of tree
      tree[@node_name].each do |k, v|
          @children << Tree.new(k => v)
      end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

family = {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}

my_tree = Tree.new family

puts "Visiting a node"
my_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
my_tree.visit_all {|node| puts node.node_name}

#Write a simple grep that will print the lines of a file having any
#occurrences of a phrase anywhere in that line. You will need to do
#a simple regular expression match and read lines from a file. (This
#is surprisingly simple in Ruby.) If you want, include line numbers.

search = /find me/
File.open("test.txt", "r") do |file|
    file.readlines.each_with_index do |line, index|
        puts "line #{index+1}: #{line}" if search =~ line
    end
end

