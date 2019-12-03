class DuplicateFrequencyFinder
  STARTING_FREQUENCY = 0

  def initialize(enumerator)
    @enumerator = enumerator
  end

  def first_duplicate_value
    frequencies = Hash.new(false)
    frequencies[STARTING_FREQUENCY] = true

    frequency = STARTING_FREQUENCY
    @enumerator.cycle.each do |line|
      operator = line[0]
      value = line[1..-1].to_i
      frequency = frequency.public_send(operator, value)

      if frequencies[frequency]
        return frequency
      else
        frequencies[frequency] = true
      end
    end
  end
end
