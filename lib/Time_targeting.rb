require 'csv'
require 'date'
require 'time'

contents = CSV.open('event_attendees.txt', headers: true, header_converters: :symbol)
date = []

def time_formatting(reg_date)
  Time.strptime(reg_date,  "%m/%d/%Y %k:%M").hour
end

date = []

contents.each do |row|
  name = row[:first_name]
  reg_date = row[:regdate]
 
  date << time_formatting(reg_date)
end

date_in_hash = date.tally;
puts "The peak registration hours(the hours with the highest number of registration) are: #{date_in_hash.key(3)}:00 and #{date_in_hash.key(3) + 3}:00"
 # p date_in_hash.values.max