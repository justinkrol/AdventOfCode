require_relative 'password_solver'

input_range = 128392..643281
puts PasswordSolver.new(input_range).valid_passwords.count
