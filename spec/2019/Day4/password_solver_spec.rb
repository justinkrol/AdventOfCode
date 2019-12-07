require '2019/Day4/password_solver'
require 'byebug'

RSpec.describe PasswordSolver, "#valid_passwords" do
  it "finds valid passwords" do
    range = 100000..333333
    test_cases = [
      111111,
    ]

    test_cases.each do |test_case|
      valid_passwords = PasswordSolver.new(range).valid_passwords
      expect((valid_passwords & test_cases).size).to eq(1)
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
      expect((valid_passwords & test_cases).size).to eq(0)
    end
  end
end
