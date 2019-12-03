class FrequencyCalculator
  STARTING_FREQUENCY = 0

  def initialize(enumerator)
    @enumerator = enumerator
  end

  def calculated_value
    @calculated_value ||= begin
      frequency = STARTING_FREQUENCY
      @enumerator.each do |line|
        operator = line[0]
        value = line[1..-1].to_i
        frequency = frequency.public_send(operator, value)
      end
      frequency
    end
  end
end
