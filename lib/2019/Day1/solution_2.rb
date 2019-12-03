require_relative 'duplicate_frequency_finder'

INPUT_FILE = 'input.txt'
File.open("#{__dir__}/#{INPUT_FILE}") do |file|
  enumerator = file.each_line.lazy
  puts DuplicateFrequencyFinder.new(enumerator).first_duplicate_value
end

