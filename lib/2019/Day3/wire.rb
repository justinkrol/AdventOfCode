class Node
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def sibling_from_move(instruction)
    # parse instruction
    # find new_x by adding to @x
    # find new_y by adding to @y

    Node.new(x + instruction.x_change, y + instruction.y_change)
  end

  def manhattan_distance_from(node)
    x_delta = (x - node.x).abs
    y_delta = (y - node.y).abs

    x_delta + y_delta
  end

  def to_s
    "(#{x}, #{y})"
  end
end

class Instruction
  UP = 'U'
  RIGHT = 'R'
  DOWN = 'D'
  LEFT = 'L'

  def initialize(instruction_string)
    @instruction_string = instruction_string
  end

  def x_change
    parsed[0]
  end

  def y_change
    parsed[1]
  end

  private

  def parsed
    @parsed ||= begin
      direction = @instruction_string[0]
      value = @instruction_string[1..-1].to_i
      case direction
      when UP
        [0, value]
      when RIGHT
        [value, 0]
      when DOWN
        [0, -value]
      when LEFT
        [-value, 0]
      end
    end
  end
end

class Edge
  attr_accessor :start_node, :end_node

  def initialize(start_node, end_node)
    @start_node = start_node
    @end_node = end_node
  end

  def horizontal?
    start_node.y - end_node.y == 0
  end

  def vertical?
    start_node.x - end_node.x == 0
  end

  def intersection_with(edge)
    if horizontal? && edge.vertical?
      edges_intersection(self, edge)
    elsif vertical? && edge.horizontal?
      edges_intersection(edge, self)
    else
      nil
    end
  end

  def edges_intersection(horizontal, vertical)
    x_set = [horizontal.start_node.x, horizontal.end_node.x].sort
    y_set = [vertical.start_node.y, vertical.end_node.y].sort

    vertical_x = vertical.start_node.x
    horizontal_y = horizontal.start_node.y

    if (x_set[0]..x_set[1]).cover?(vertical_x) && (y_set[0]..y_set[1]).cover?(horizontal_y)
      Node.new(vertical_x, horizontal_y)
    else
      nil
    end
  end

  def to_s
    "#{start_node} -> #{end_node}"
  end
end

class Wire
  def initialize(start_node, path)
    @start_node = start_node
    @path = path
  end

  def closest_manhattan_distance_intersection_with(other_wire)
    distances = intersection_nodes_with(other_wire)
      .map { |intersection_node| intersection_node.manhattan_distance_from(@start_node) }.sort
    distances[0] > 0 ? distances[0] : distances[1]
  end

  def edges
    @edges ||= begin
      current_node = Node.new(0, 0)
      @path.each_with_object([]) do |move_instruction, edges|
        end_node = current_node.sibling_from_move(Instruction.new(move_instruction))
        edges << Edge.new(current_node, end_node)
        current_node = end_node
      end
    end
  end

  def intersection_nodes_with(other_wire)
    intersections = []

    edges.each_with_index do |this_edge, i|
      other_wire.edges.each_with_index do |other_edge, j|
        intersection = this_edge.intersection_with(other_edge)
        if intersection
          intersections << intersection
        end
      end
    end
    intersections
  end
end
