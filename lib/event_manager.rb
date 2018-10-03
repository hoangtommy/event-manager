require 'csv'

puts 'EventManager Initialized!'

# Reads entire file all at once
# contents = File.read '../event_attendees.csv'
# puts contents

# Reads line by line by creating an array using #readlines
# lines = File.readlines '../event_attendees.csv'
# lines.each do |line|
#   puts line
# end

# Split each row of data (and its column) into an array
# lines = File.readlines '../event_attendees.csv'
# lines.each_with_index do |line, idx|
#   next if idx == 0
#   columns = line.split(',')
#   name = columns[2]
#   puts name
# end

#  -------- --------- --------- --------- --------- --------- --------- ---------

def clean_zipcode(zipcode)
  if zipcode.nil?
  	zipcode = '00000'
  elsif zipcode.length < 5
    zipcode = zipcode.rjust(5, '0')
  elsif zipcode.length > 5
  	zipcode = zipcode[0..4]
  end
end

# Using the built-in ruby csv parser
contents = CSV.open '../event_attendees.csv', headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} lives in #{zipcode}"
end

