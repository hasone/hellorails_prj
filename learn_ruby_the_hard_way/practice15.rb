filename = ARGV.first

txt = open filename

puts "Here's your file #{filename}"
puts txt.read

print "Type the filename again: "
file_again = $stdin.gets.chomp
puts "Here's the file your type again #{file_again}"
txt_again = open file_again
puts txt_again.read
