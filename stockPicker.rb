require 'pry'
require_relative 'feeder'

#
# This displays the basic welcome prompt
#
puts
puts "********************"
puts "Welcome to the Random Stock Picker."
puts "********************"
puts
puts "There are indices: "
puts "1. NYSE"
puts "2. NASDAQ"
puts "Press enter to select one of those indices."
gets.chomp
puts "The index randomly selected for you is: "

#
# We generate a random number between 1 and 2 (both inclusive) here, using the function given below.
# 1 corresponds to the NYSE, 2 to the NASDAQ.
# The number generated is passed to another script, that loads the corresponding CSV file
# containing the list of companies into the program.
#
random = 1+rand(2) # Generates a random number between 1 and 2

case random
when 1	# 1 corresponds to NYSE
	puts "NYSE"
	feeder1 = Feeder.new(random)
	feeder1.run
when 2	# 2 corresponds to NASDAQ
	puts "NASDAQ"
	feeder1 = Feeder.new(random)
	feeder1.run
end	# Close the case statement

puts "********************"
puts "Here are the 8 stocks selected at random:"
puts "********************"

#
# We now sample the hash of companies, and come up with 8 stocks
#
8.times do |index| 
	sampler = feeder1.companies.keys.sample	
	company = feeder1.companies[sampler].to_s.strip
	while company.empty?
		sampler = feeder1.companies.keys.sample	
		company = feeder1.companies[sampler].to_s.strip	
	end	# end while loop
	puts (index+1).to_s << ". " << company
end	# Close 8.times loop

# 
# Displays the final prompt
#
puts "********************"
puts "8 stocks were selected. 3 stocks are to be set aside to use as backup, in case data cannot be found on any of the first 5 stocks."
puts "********************"
puts
puts "Goodbye!"
puts
