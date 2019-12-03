require '2019/Day1/duplicate_frequency_finder'

RSpec.describe DuplicateFrequencyFinder, "#first_duplicate_value" do
  it "calculates the correct value from a sequence of strings containing either + or -" do
    calculator_1 = DuplicateFrequencyFinder.new(['+1', '-1'].to_enum)
    expect(calculator_1.first_duplicate_value).to eq(0)

    calculator_2 = DuplicateFrequencyFinder.new(['+3', '+3', '+4', '-2', '-4'].to_enum)
    expect(calculator_2.first_duplicate_value).to eq(10)

    calculator_3 = DuplicateFrequencyFinder.new(['-6', '+3', '+8', '+5', '-6'].to_enum)
    expect(calculator_3.first_duplicate_value).to eq(5)

    calculator_4 = DuplicateFrequencyFinder.new(['+7', '+7', '-2', '-7', '-4'].to_enum)
    expect(calculator_4.first_duplicate_value).to eq(14)
  end
end
