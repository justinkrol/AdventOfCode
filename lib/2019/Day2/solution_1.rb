require_relative 'intcode_computer'

INPUT_FILE = 'input.txt'
line = File.open("#{__dir__}/#{INPUT_FILE}") { |file| file.readline }
memory = line.split(",").map { |s| s.to_i }

intcode_computer = IntcodeComputer.new

# Restore "gravity assist" program state
memory[1] = 12
memory[2] = 2

intcode_computer.memory = memory
intcode_computer.process!
puts intcode_computer.memory[0]
