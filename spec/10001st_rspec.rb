require_relative "../10001st"

RSpec.describe Numbers do
  subject { described_class.nth_prime_number(number) }
  describe ".nth_prime_number" do
  	context "when assessing positive cases" do
			let(:number) { 10001 }
    	it { is_expected.to eq("the 10001st prime is 104743") }
  	end
    context "when assessing negative cases" do
      let(:number) { "10001" }
      it { is_expected.to eq("the number must be an integer") }
		end
	end
end

