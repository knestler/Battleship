require './lib/round'

puts 'Welcome to BATTLESHIP'
puts 'Enter p to play. Enter q to quit.'

play = gets.chomp
round = Round.new

loop do
  
  if play == "p"
    puts round.start
    break
  elsif play == "q"
    puts "Goodbye!"
    break
  else
    puts "Invalid input. \n" + "Enter p to play. Enter q to quit."
    play = gets.chomp
  end
end

def winner
  if round.player_loses == true
    puts "I won!"
  elsif round.computer_loses == true
    puts "You won!"
  else
    round.take_turn
  end
end
