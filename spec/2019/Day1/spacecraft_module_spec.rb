require '2019/Day1/spacecraft_module'

RSpec.describe SpacecraftModule, "#fuel_requirement" do
  it "calculates the correct fuel requirement based on its mass" do
    spacecraft_module_1 = SpacecraftModule.new(12)
    expect(spacecraft_module_1.fuel_requirement).to eq(2)

    spacecraft_module_2 = SpacecraftModule.new(14)
    expect(spacecraft_module_2.fuel_requirement).to eq(2)

    spacecraft_module_3 = SpacecraftModule.new(1969)
    expect(spacecraft_module_3.fuel_requirement).to eq(654)

    spacecraft_module_4 = SpacecraftModule.new(100756)
    expect(spacecraft_module_4.fuel_requirement).to eq(33583)
  end
end
