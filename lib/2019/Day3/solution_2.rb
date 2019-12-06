require_relative 'wire'

INPUT_FILE = 'input.txt'
line_1 = nil
line_2 = nil
File.open("#{__dir__}/#{INPUT_FILE}") do |file|
  line_1 = file.readline
  line_2 = file.readline
end

start_node = Node.new(0, 0)
wire_1 = Wire.new(start_node, line_1.split(','))
wire_2 = Wire.new(start_node, line_2.split(','))

puts wire_1.closest_path_distance_intersection_with(wire_2)
