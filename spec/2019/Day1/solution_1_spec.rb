require '2019/Day1/frequency_calculator'

RSpec.describe FrequencyCalculator, "#calculated_value" do
  it "calculates the correct value from a sequence of strings containing either + or -" do
    calculator_1 = FrequencyCalculator.new(['+1', '+1', '+1'].to_enum)
    expect(calculator_1.calculated_value).to eq(3)

    calculator_2 = FrequencyCalculator.new(['+1', '+1', '-2'].to_enum)
    expect(calculator_2.calculated_value).to eq(0)

    calculator_3 = FrequencyCalculator.new(['-1', '-2', '-3'].to_enum)
    expect(calculator_3.calculated_value).to eq(-6)
  end
end
