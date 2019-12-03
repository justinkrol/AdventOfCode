require_relative 'fuel_counter_upper'
require_relative 'recursive_spacecraft_module'

INPUT_FILE = 'input.txt'
File.open("#{__dir__}/#{INPUT_FILE}") do |file|
  enumerator = file.each_line.lazy
  puts FuelCounterUpper.new(enumerator, RecursiveSpacecraftModule).sum
end
