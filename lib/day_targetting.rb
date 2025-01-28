require 'csv'
require 'date'
require 'time'

contents = CSV.open('event_attendees.txt', headers: true, header_converters: :symbol)
day = []

contents.each do |row|
  name = row[:first_name]
  reg_date = row[:regdate]
 
  day << Time.strptime(reg_date,"%m/%d/%Y %k:%M").wday
  
end
puts "The day of the week with the highest user registration is the #{day.mode}th day"
