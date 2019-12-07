require_relative 'instruction'

class IntcodeComputer
  HALT_OPCODE = 99.freeze

  attr_accessor :memory

  def process!
    pointer = 0
    loop do
      instruction = InstructionFactory.build_for(@memory[pointer])
      return if instruction.halt?

      instruction.process(memory, pointer)
      pointer += instruction.mem_count
    end
  end
end
