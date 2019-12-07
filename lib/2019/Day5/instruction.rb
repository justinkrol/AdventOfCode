require 'byebug'

class Instruction
  attr_reader :parameter_modes

  def initialize(parameter_modes)
    @parameter_modes = parameter_modes
  end

  def process(memory, instruction_pointer)
    @memory = memory
    @instruction_pointer = instruction_pointer

    load_parameters
    perform
  end

  def mem_count
    raise NotImplementedError
  end

  def halt?
    false
  end

  private

  def load_parameters
    raise NotImplementedError
  end

  def perform
    raise NotImplementedError
  end

  def load_parameter(index)
    parameter = @memory[@instruction_pointer + index + 1]
    case @parameter_modes[index]
    when 1
      parameter
    when 0, nil
      @memory[parameter]
    end
  end

  def load_write_position(index)
    @memory[@instruction_pointer + index + 1]
  end
end

class ArithmeticInstruction < Instruction
  def mem_count
    4
  end

  private

  def perform
    result = @value_1.public_send(operator, @value_2)
    @memory[@write_position] = result
  end

  def load_parameters
    @value_1 = load_parameter(0)
    @value_2 = load_parameter(1)
    @write_position = load_write_position(2)
  end

  def operator
    raise NotImplementedError
  end
end

class AdditionInstruction < ArithmeticInstruction
  private

  def operator
    :+
  end
end

class MultiplicationInstruction < ArithmeticInstruction
  private

  def operator
    :*
  end
end

class InputInstruction < Instruction
  def mem_count
    2
  end

  private

  def perform
    print "Please enter input: "
    input = gets.chomp.to_i
    @memory[@write_position] = input
  end

  def load_parameters
    @write_position = load_write_position(0)
  end
end

class OutputInstruction < Instruction
  def mem_count
    2
  end

  private

  def perform
    puts @value_1
  end

  def load_parameters
    @value_1 = load_parameter(0)
  end
end

class HaltInstruction < Instruction
  def halt?
    true
  end
end

class InstructionFactory
  INSTRUCTION_TYPES = {
    1 => AdditionInstruction,
    2 => MultiplicationInstruction,
    3 => InputInstruction,
    4 => OutputInstruction,
    99 => HaltInstruction,
  }.freeze

  def self.build_for(value)
    opcode = value % 100
    parameter_modes = []
    loop do
      degree = 10 ** (parameter_modes.size)
      break if value < 100 * degree
      mode = (value / (100 * degree)) % 10

      parameter_modes << mode
    end
    INSTRUCTION_TYPES[opcode].new(parameter_modes)
  end
end
