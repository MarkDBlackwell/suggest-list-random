=begin
Author: Mark D. Blackwell, Megan Amoss
Dates:
2020-10-25 - created.
Works on Ruby 2.2.5.
Purpose: To suggest an item to focus on for daily musical instrument practice, selected randomly from a list.
=end

filename_in = 'input.txt'
filename_log = 'log.txt'
filename_randomized = 'randomized.txt'

f_in = File.open filename_in, 'r'
f_log = File.open filename_log, 'a'

# Create randomized file if necessary:

unless FileTest.size? filename_randomized
  puts 'File started.'

# Copy input file to randomized file:

  File.open filename_randomized, 'w' do |f|
    f_in.readlines.shuffle.each do |line|
      f.puts line
    end
  end
end

# Chop out a line from the randomized file:

lines = [] # Predefine for block.

File.open filename_randomized, 'r+' do |f|
  lines_randomized = f.readlines
  lines.push lines_randomized.pop
  f.reopen filename_randomized, 'w'
  lines_randomized.each do |e|
    f.puts e
  end
end
line = lines.first # Our line.

# Get the date:

now = Time.now
ymd = now.strftime '%Y %B %d'

# Do stuff with our line:

puts "#{ymd} - #{line}"
f_log.puts "#{ymd} - #{line}"
