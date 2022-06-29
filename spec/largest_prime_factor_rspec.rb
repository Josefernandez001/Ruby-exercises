require_relative "../largest_prime_factor"

RSpec.describe Factors do 
  subject { described_class.highest_prime_factor(number) }
  describe ".highest_prime_factor" do 
    context "when assessing positive cases" do 

      describe "when the number is 12" do 
          let(:number) {12}
          it { is_expected.to eq("the largest prime factor is: 3")}
      end

      describe "when the number is 90" do 
          let(:number) {90}
          it { is_expected.to eq("the largest prime factor is: 5")}
      end

      describe "when the number is 600851475143" do 
          let(:number) {600851475143}
          it { is_expected.to eq("the largest prime factor is: 6857")}
      end

    end
    context "when assessing negative cases" do 
      
      describe "when not is a number" do 
          let(:number) {"9"}
          it { is_expected.to eq("the number must be an integer")}
      end
      
    end
  end
end