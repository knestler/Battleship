require './lib/round'






loop do
  puts 'Welcome to BATTLESHIP'
  puts 'Enter p to play. Enter q to quit.'
  play = gets.chomp.downcase
  until play == "p" || play == "q"
    puts "Invalid input. \n" + "Enter p to play. Enter q to quit."
    play
  end
  if play == "p"
    round = Round.new
    round.start
    if round.computer_won?
      puts "I won!"
    else
      puts "You won!"
    end
  else
    puts "Goodbye!"
    break
  end
end
