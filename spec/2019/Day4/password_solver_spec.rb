require '2019/Day4/password_solver'

RSpec.describe PasswordSolver, "#valid_passwords" do
  it "finds valid passwords" do
    range = 100000..333333
    test_cases = [
      111111,
    ]

    test_cases.each do |test_case|
      valid_passwords = PasswordSolver.new(range).valid_passwords
      test_cases.each do |test_case|
        expect(valid_passwords).to include(test_case)
      end
    end
  end

  it "does not return invalid passwords" do
    range = 100000..333333
    test_cases = [
      223450,
      123789
    ]

    test_cases.each do |test_case|
      valid_passwords = PasswordSolver.new(range).valid_passwords
      test_cases.each do |test_case|
        expect(valid_passwords).not_to include(test_case)
      end
    end
  end
end

RSpec.describe PasswordSolverDoublesOnly, "#valid_passwords" do
  it "finds valid passwords" do
    range = 100000..333333
    test_cases = [
      112233,
      111122,
      224445,
    ]

    test_cases.each do |test_case|
      valid_passwords = PasswordSolverDoublesOnly.new(range).valid_passwords
      test_cases.each do |test_case|
        expect(valid_passwords).to include(test_case)
      end
    end
  end

  it "does not return invalid passwords" do
    range = 100000..333333
    test_cases = [
      123444,
    ]

    test_cases.each do |test_case|
      valid_passwords = PasswordSolverDoublesOnly.new(range).valid_passwords
      test_cases.each do |test_case|
        expect(valid_passwords).not_to include(test_case)
      end
    end
  end
end
