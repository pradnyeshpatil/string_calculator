require 'thor'
require_relative 'calculator'

module StringCalculator
  class CLI < Thor
    desc "add STRING", "Adds numbers from the input string"
    def add(input)
      calculator = Calculator.new
      result = calculator.add(input)
      puts "Result: #{result}"
    rescue => e
      puts "Error: #{e.message}"
    end
  end
end


if __FILE__ == $0
  puts "Enter numbers (type \\n for newline or press Enter twice to end):"
  lines = []
  while (line = gets.chomp)
    break if line.empty?
    lines << line
  end
  input = lines.join("\n")
  cli = StringCalculator::CLI.new
  cli.add(input)
end