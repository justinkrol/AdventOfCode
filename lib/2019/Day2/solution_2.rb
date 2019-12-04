require_relative 'intcode_computer'

# Restore "gravity assist" program state
def run_program_for_inputs(intcode_computer, starting_memory, noun, verb)
  memory = starting_memory.dup
  memory[1] = noun
  memory[2] = verb

  intcode_computer.memory = memory
  intcode_computer.process!
  intcode_computer.memory[0]
end

def find_inputs_for_output(intcode_computer, starting_memory, desired_output)
  NOUN_VERB_RANGE.each do |noun|
    NOUN_VERB_RANGE.each do |verb|
      return [noun, verb] if run_program_for_inputs(intcode_computer, starting_memory, noun, verb) == desired_output
    end
  end
end

INPUT_FILE = 'input.txt'
line = File.open("#{__dir__}/#{INPUT_FILE}") { |file| file.readline }
starting_memory = line.split(",").map { |s| s.to_i }

intcode_computer = IntcodeComputer.new
NOUN_VERB_RANGE = (1..99)
DESIRED_OUTPUT = 19690720

required_inputs = find_inputs_for_output(intcode_computer, starting_memory, DESIRED_OUTPUT)
puts 100 * required_inputs[0] + required_inputs[1]
