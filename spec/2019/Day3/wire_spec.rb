require '2019/Day3/wire'

RSpec.describe Wire, "#closest_manhattan_distance_intersection_with!" do
  it "returns the correct distance" do
    test_cases = [
      {
        wire_1: ['R75','D30','R83','U83','L12','D49','R71','U7','L72'],
        wire_2: ['U62','R66','U55','R34','D71','R55','D58','R83'],
        distance: 159,
      },
      {
        wire_1: ['R98','U47','R26','D63','R33','U87','L62','D20','R33','U53','R51'],
        wire_2: ['U98','R91','D20','R16','D67','R40','U7','R15','U6','R7'],
        distance: 135,
      },
    ]

    test_cases.each do |test_case|
      start_node = Node.new(0, 0)
      wire_1 = Wire.new(start_node, test_case[:wire_1])
      wire_2 = Wire.new(start_node, test_case[:wire_2])

      expect(wire_1.closest_manhattan_distance_intersection_with(wire_2)).to eq(test_case[:distance])
    end
  end
end

RSpec.describe Wire, "#closest_path_distance_intersection_with!" do
  it "returns the correct distance" do
    test_cases = [
      {
        wire_1: ['R75','D30','R83','U83','L12','D49','R71','U7','L72'],
        wire_2: ['U62','R66','U55','R34','D71','R55','D58','R83'],
        distance: 610,
      },
      {
        wire_1: ['R98','U47','R26','D63','R33','U87','L62','D20','R33','U53','R51'],
        wire_2: ['U98','R91','D20','R16','D67','R40','U7','R15','U6','R7'],
        distance: 410,
      },
    ]

    test_cases.each do |test_case|
      start_node = Node.new(0, 0)
      wire_1 = Wire.new(start_node, test_case[:wire_1])
      wire_2 = Wire.new(start_node, test_case[:wire_2])

      expect(wire_1.closest_path_distance_intersection_with(wire_2)).to eq(test_case[:distance])
    end
  end
end
