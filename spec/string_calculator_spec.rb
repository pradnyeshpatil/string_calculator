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
    end
  end
end