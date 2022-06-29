require_relative "../multiples_3_and_5"
RSpec.describe Multiples do
  subject {described_class.sum_multiples3and5(limit)}
  describe "sum_multiples3and5" do 
    context "when assessing positive cases" do 
      
      describe "when the limit is 999" do 
        let(:limit) {999}
        it { is_expected.to eq("the sum of the multiples 3 and 5 is : 233169 when the limit is 999")}
      end
      
      describe "when the limit is 412" do 
        let(:limit) {400}
        it { is_expected.to eq("the sum of the multiples 3 and 5 is : 37669 when the limit is 400")}
      end
      
      describe "when the limit is 12" do 
        let(:limit) {12}
        it { is_expected.to eq("the sum of the multiples 3 and 5 is : 46 when the limit is 12")}
      end

    end

    context "when assessing negative cases" do 
      describe "when the limit is a string" do 
        let(:limit) {"12"}
        it { is_expected.to eq("the limit must be an integer")}
      end

    end
  end
end
