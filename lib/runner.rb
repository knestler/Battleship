puts 'Welcome to BATTLESHIP'
puts 'Enter p to play. Enter q to quit.'

play = gets.chomp

loop do
  if play == "p"
    puts "round.start"
    break
  elsif play == "q"
    puts "Goodbye!"
    break
  else
    puts "Invalid input. \n" + "Enter p to play. Enter q to quit."
    play = gets.chomp
  end
end
