require_relative 'intcode_computer'

INPUT_FILE = 'input.txt'
line = File.open("#{__dir__}/#{INPUT_FILE}") { |file| file.readline }
memory = line.split(",").map { |s| s.to_i }

intcode_computer = IntcodeComputer.new

intcode_computer.memory = memory
intcode_computer.process!
