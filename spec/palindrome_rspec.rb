require_relative "../palindrome"

RSpec.describe Palindrome do
    subject{ described_class.palindrome_word(word) }
    describe ".palindrome_word" do 
        context "when assessing positive cases" do 
            describe "when the value of word is poop" do 
                let(:word) {"poop"}
                it {is_expected.to eq("the word 'poop' is palindrome")}
            end
            describe "when the value of word is cooc" do 
                let(:word) {"cooc"}
                it {is_expected.to eq("the word 'cooc' is palindrome")}
            end
            describe "when the value of word is lool" do 
                let(:word) {"lool"}
                it {is_expected.to eq("the word 'lool' is palindrome")}                
            end
        end
        context "when assessing negative cases" do 
            describe "when the value of word is 4" do 
                let(:word) { 4 }
                it {is_expected.to eq("the word must be a string")}                
            end
            describe "when the value of word lool" do 
                let(:word) {"coop"}
                it {is_expected.to eq("the word 'coop' not is palindrome")}                
            end
        end
    end
end