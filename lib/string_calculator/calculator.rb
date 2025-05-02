module StringCalculator
  class Calculator
    def add(input)
      if input == ''
        return 0
      end
      sum = 0 
      input = input.gsub('\\n', "\n").gsub("\n", ',')
      input.split(',').each do  |n|
        sum = sum + n.to_i
      end
      return sum
    end
  end
end