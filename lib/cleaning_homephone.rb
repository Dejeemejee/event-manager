require 'csv'

puts "Hii"

contents = CSV.open('event_attendees.txt', headers: true, header_converters: :symbol)
#puts contents


def cleaning_homephone(homephone)
   homephone.delete!('^0-9')
   if (homephone.length == 11) && (homephone.split("").map(&:to_i)[0] == 1)
    return homephone = homephone[1..10]
   elsif (homephone.length == 5)
    puts "Provide a correct number"
   end
   puts "#{homephone} #{homephone.length}"
end

contents.each do |row|
  name = row[:first_name]
  homephone = row[:homephone]
  
   #homephone.delete!('-')
   #homephone.delete!(' ')
   #homephone.delete!('.')
   #homephone.delete!('( )')
  cleaning_homephone(homephone)
end