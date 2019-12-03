require '2019/Day1/fuel_counter_upper'

RSpec.describe FuelCounterUpper, "#first_duplicate_value" do
  it "calculates the total fuel requirement for a list of module masses" do
    fuel_counter_upper = FuelCounterUpper.new(%w(12 14 1969 100756).to_enum)
    expect(fuel_counter_upper.sum).to eq(34241)
  end
end
