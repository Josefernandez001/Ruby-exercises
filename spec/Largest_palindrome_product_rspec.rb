require_relative "../Largest_palindrome_product"

RSpec.describe Palindrome do 
  subject {described_class.greater_palindrome_product()}
  describe ".greater_palindrome_product" do 
    context "when assessing positive cases" do 
      it { is_expected.to eq("the palindrome product is  906609 = 913x993") }
    end
  end
end
