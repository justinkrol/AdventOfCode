require_relative 'frequency_calculator'

INPUT_FILE = 'input.txt'
File.open("#{__dir__}/#{INPUT_FILE}") do |file|
  enumerator = file.each_line.lazy
  puts FrequencyCalculator.new(enumerator).calculated_value
end

### SIMPLE SOLUTION ###

# INPUT_FILE = 'input.txt'
# STARTING_FREQUENCY = 0

# frequency = STARTING_FREQUENCY
# File.foreach(INPUT_FILE) do |line|
#   operator = line[0]
#   value = line[1..-1].to_i
#   frequency = frequency.public_send(operator, value)
# end
# puts frequency

### END ###
