#!/usr/bin/env ruby

lower_bound = 0
upper_bound = 100
number = rand(upper_bound)

# 0-100: 50
# 0-50: 25
# 50-100: 75
def best_guess(lower_bound, upper_bound)
  lower_bound + (upper_bound - lower_bound) / 2
end

def next_guess(message, lower_bound, upper_bound, counter)
  suggestion = best_guess(lower_bound, upper_bound)
  puts ""
  print "#{message} Take another guess (you know it's between #{lower_bound} and #{upper_bound})."
  if counter % 2 == 0
    print "We suggest #{suggestion}."
  end
  print " "
end

puts "Welcome to the number guessing game."
print "Please wait until I think of a number"

deep_thoughts = [
  'this is hard',
  'almost got it',
  "whew, I'm starting to sweat"
].sort_by { rand(100000) }

10.times do |i|
  print "."
  if rand(5) == 1
    if thought = deep_thoughts.shift
      print " "
      print thought
    end
  end
  sleep 0.15
end

puts " Got it!. Let's start"

puts ""
puts "Please guess a number: "
counter = 0

while true

  guess = gets.to_i
  counter+=1
  
  if guess == number
    puts ""
    if counter == 1
      puts "You got it on your first guess!"
    elsif counter == 2
      puts "Nice 2nd guess!"
    elsif counter == 3
      puts "3 is a good number for guesses!"
    elsif counter == 4
      puts "4 guesses  is really cool!"
    elsif counter == 5
      puts "Top 5 guesses!"
    elsif counter == 6
      puts "6 is the magic number of guesses!"
    else
      puts "You got it! You took #{counter} guesses!"
    end
    break

  elsif guess < number
    if lower_bound < guess
      lower_bound = guess
    end
    next_guess("Too low!", lower_bound, upper_bound, counter)

  else guess < number
    if upper_bound > guess
      upper_bound = guess
    end
    next_guess("Too high!", lower_bound, upper_bound, counter)
  end

end


