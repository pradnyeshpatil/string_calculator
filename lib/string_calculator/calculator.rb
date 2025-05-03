module StringCalculator
  class Calculator
    def add(input)
      input = input.gsub('\\n', "\n")
      return 0 if input == ''
      sum = 0
      delimiter = /[,\n]/
      numbers_string = input

      if input.start_with?('//')
        delimiter_line, numbers_string = input.split("\n", 2)
        custom_delimiter = delimiter_line[2..-1]
        delimiter = Regexp.new(Regexp.escape(custom_delimiter))
      end

      numbers = numbers_string.split(delimiter).map(&:to_i)

      negatives = numbers.select { |n| n < 0 }
      unless negatives.empty?
        raise "Negative numbers not allowed: #{negatives.join(',')}"
      end

      numbers.each do  |n|
        sum = sum + n.to_i
      end
      return sum
    end
  end
end