require '2019/Day1/recursive_spacecraft_module'

RSpec.describe RecursiveSpacecraftModule, "#fuel_requirement" do
  it "calculates the correct fuel requirement based on its mass" do
    spacecraft_module_1 = RecursiveSpacecraftModule.new(14)
    expect(spacecraft_module_1.fuel_requirement).to eq(2)

    spacecraft_module_2 = RecursiveSpacecraftModule.new(1969)
    expect(spacecraft_module_2.fuel_requirement).to eq(966)

    spacecraft_module_3 = RecursiveSpacecraftModule.new(100756)
    expect(spacecraft_module_3.fuel_requirement).to eq(50346)
  end
end
