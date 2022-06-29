require_relative "../factorial.rb"

RSpec.describe Factorial do
  subject {described_class.print_sequence(limit)}
  describe ".print_sequence" do 
    
    context "when assessing positive cases" do
      let(:limit) { 10 }
      it { is_expected.to eq(" 10x9x8x7x6x5x4x3x2x1 = 3628800")}
    end

    context "when assessing negative cases" do
      let(:limit) { "10" }
      it { is_expected.to eq("the limit must be an integer")}
    end
    
  end
end