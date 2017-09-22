require 'pry'
require 'csv'

class Feeder
	attr_accessor :file, :companies

	def initialize (exch_name)
		case exch_name
		when 1
			@file = 'NYSE.csv'
		when 2
			@file = 'NASDAQ.csv'
		end
		@companies = Hash.new
	end # End of initialize method

	def run
		index = 0
		puts 
		puts "Scanning file: " << @file
		CSV.foreach(@file, headers: true) do |row|
#			puts index
			index+=1
			@companies[index] = row['Security Name'].to_s		
		end	# End of CSV.foreach
		puts 
	end	# End of run method
end	# End of class
