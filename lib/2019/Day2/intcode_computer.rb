class Instruction
  def process(memory, instruction_pointer)
    @memory = memory
    @instruction_pointer = instruction_pointer

    load_parameters
    perform
  end

  def mem_count
    raise NotImplementedError
  end

  private

  def perform
    raise NotImplementedError
  end

  def load_parameters
    raise NotImplementedError
  end
end

class ArithmeticInstruction < Instruction
  def initialize(operator)
    @operator = operator
  end

  def mem_count
    4
  end

  private

  def perform
    result = @value_1.public_send(@operator, @value_2)
    @memory[@position] = result
  end

  def load_parameters
    @value_1 = load_value(@memory[@instruction_pointer+1])
    @value_2 = load_value(@memory[@instruction_pointer+2])
    @position = @memory[@instruction_pointer+3]
  end

  def load_value(position)
    @memory[position]
  end
end

class IntcodeComputer
  INSTRUCTIONS = {
    1 => ArithmeticInstruction.new(:+),
    2 => ArithmeticInstruction.new(:*),
  }.freeze

  HALT_OPCODE = 99.freeze

  attr_accessor :memory

  def process!
    pointer = 0
    loop do
      instruction_opcode = memory[pointer]
      raise 'Must terminate with OPCODE 99' unless instruction_opcode
      return if instruction_opcode == HALT_OPCODE

      instruction = INSTRUCTIONS[instruction_opcode]
      raise 'Invalid instruction set' unless instruction

      instruction.process(memory, pointer)
      pointer += instruction.mem_count
    end
  end
end



