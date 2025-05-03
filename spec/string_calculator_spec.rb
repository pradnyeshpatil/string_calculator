require "spec_helper"
require "string_calculator/calculator"

RSpec.describe StringCalculator::Calculator do
  describe "String Calculator" do
    let(:calculator) { described_class.new }

    context "#add action" do
      it "return 0 when empty string is pass" do
        expect(calculator.add("")).to eq(0)
      end

      it "return number for single number" do
        expect(calculator.add("1")).to eq(1)
      end

      it "return sum of 2 numbers" do
        expect(calculator.add("1, 3")).to eq(4)
      end

      it "return sum of multiple numbers" do
        expect(calculator.add("1,3,2,4,5")).to eq(15)
      end

      it "should support new lines as delimiters" do
        expect(calculator.add("1\n2,3")).to eq(6)
      end

      it "should supports custom delimiter" do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it "should raises error for negative numbers" do
        expect { calculator.add("1,-2,3,-5") }.to raise_error("Negative numbers not allowed: -2,-5")
      end
    end
  end
end