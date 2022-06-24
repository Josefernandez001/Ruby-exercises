require_relative "../even_fibonnaci_number"

RSpec.describe Fibonnaci do 
  subject { described_class.fibonacci_pair_sum(limit) }
  describe ".fibonacci_pair_sum" do
    context "when assessing positive cases" do
      let(:limit) { 400000000 }
      it { is_expected.to eq("the sum is  : 350704366") }
    end
    context "when assessing negative cases" do
      let(:limit) { "400000000" }
      it { is_expected.to eq("the limit must be an integer") }
    end
  end
end
