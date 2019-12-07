require_relative 'instruction'

module Day5
  class IntcodeComputer
    HALT_OPCODE = 99.freeze

    attr_accessor :memory

    def process!
      pointer = 0
      loop do
        instruction = InstructionFactory.build_for(@memory[pointer])
        return if instruction.halt?

        instruction.process(memory, pointer)
        pointer = instruction.new_pointer
      end
    end
  end
end
