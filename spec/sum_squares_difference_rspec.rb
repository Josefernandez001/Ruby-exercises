require_relative "../sum_square_difference"

RSpec.describe Squares do 
    subject{described_class.difference_sum_of_squares}
    describe "difference_sum_of_squares" do 
        describe "when the limit is 100" do 
            it {is_expected.to eq("the difference is : 25164150")}
        end
    end
end