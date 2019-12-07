require '2019/Day5/intcode_computer'

RSpec.describe IntcodeComputer, "#process_list!" do
  it "performs the operations correctly" do
    intcode_computer = IntcodeComputer.new

    expected_results = [
      {
        initial: [1,9,10,3,2,3,11,0,99,30,40,50],
        final: [3500,9,10,70,2,3,11,0,99,30,40,50],
      },
      {
        initial: [1,0,0,0,99],
        final: [2,0,0,0,99],
      },
      {
        initial: [2,3,0,3,99],
        final: [2,3,0,6,99],
      },
      {
        initial: [2,4,4,5,99,0],
        final: [2,4,4,5,99,9801],
      },
      {
        initial: [1,1,1,4,99,5,6,0,99],
        final: [30,1,1,4,2,5,6,0,99],
      },
    ]

    expected_results.each do |pair|
      intcode_computer.memory = pair[:initial]
      intcode_computer.process!
      expect(intcode_computer.memory).to eq(pair[:final])
    end
  end
end
