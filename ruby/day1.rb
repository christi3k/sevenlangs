# print the string hello world
puts "Hello, Ruby"

# find index of word Ruby
puts /Ruby/ =~ "Hello, Ruby."

# print your name ten times
(1..10).each do ||
    puts 'Christie'
end

# print a sentnece ten times
(1..10).each do |value|
    puts "This is sentence number #{value}."
end

# random number guesser
my_num = rand(10)
puts "What's my number?"
guess = gets.to_i
puts "Your guess is low" if guess < my_num
puts "Your guess is high" if guess > my_num
puts "Correct!" if guess == my_num
