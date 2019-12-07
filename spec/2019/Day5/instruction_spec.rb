require '2019/Day5/instruction'

module Day5
  RSpec.describe InstructionFactory, "#build_for" do
    it "builds the correct instruction" do
      instruction = InstructionFactory.build_for(1001)

      expect(instruction.parameter_modes).to eq([0,1])
      expect(instruction).to be_a(AdditionInstruction)
    end
  end

  RSpec.describe AdditionInstruction, "#process" do
    it "performs the operations correctly" do
      expected_results = [
        {
          initial: [1,5,4,4,1100,1],
          final: [1,5,4,4,1101,1],
        },
        {
          initial: [1101,100,-1,4,0],
          final: [1101,100,-1,4,99],
        },
      ]

      expected_results.each do |pair|
        memory = pair[:initial].dup
        instruction = InstructionFactory.build_for(memory[0])
        instruction.process(memory, 0)
        expect(memory).to eq(pair[:final])
      end
    end
  end

  RSpec.describe MultiplicationInstruction, "#process" do
    it "performs the operations correctly" do
      instruction = MultiplicationInstruction.new([])

      expected_results = [
        {
          initial: [1,5,4,4,1100,2],
          final: [1,5,4,4,2200,2],
        },
      ]

      expected_results.each do |pair|
        memory = pair[:initial].dup
        instruction.process(memory, 0)
        expect(memory).to eq(pair[:final])
      end
    end
  end
end
