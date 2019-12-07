class PasswordSolver
  def initialize(range)
    @range = range
  end

  def valid_passwords
    @range.select do |value|
      valid_pw?(value)
    end
  end

  def valid_pw?(value)
    arr = int_to_array(value)
    current = arr[0]
    duplicate_exists = false
    arr[1..-1].each do |digit|
      if digit < current
        return false
      elsif digit == current
        duplicate_exists = true
      else
        current = digit
      end
    end
    duplicate_exists
  end

  def int_to_array(int)
    arr = []

    while int > 0
      int, remainder = int.divmod(10)
      arr.unshift(remainder)
    end
    arr
  end
end

class PasswordSolverDoublesOnly < PasswordSolver
  def valid_pw?(value)
    arr = int_to_array(value)
    current = arr[0]
    same_in_a_row = 1
    double_exists = false
    double_confirmed = false
    arr[1..-1].each do |digit|
      if digit < current
        return false
      elsif digit == current
        same_in_a_row += 1
        double_exists = true if same_in_a_row == 2
        double_exists = false if same_in_a_row > 2
      else
        current = digit
        double_confirmed = true if same_in_a_row == 2
        same_in_a_row = 1
      end
    end
    double_confirmed || double_exists
  end
end
