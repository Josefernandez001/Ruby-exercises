# frozen_string_literal: true

require_relative '../words'

RSpec.describe Words do
  describe '#anagram' do
    subject { described_class.new.anagram }
    context 'when assessing positive cases' do
    
      describe 'running the method anagram' do
        it { is_expected.to eq(1_122) }
      end
      
    end
  end

  describe '#anagramas' do
    subject { described_class.new.anagramas }
    context 'when assessing positive cases' do
      
      describe 'running the method anagramas' do
        it { is_expected.to eq(19_783) }
      end

    end
  end

  describe '#search_anagram' do
    subject { described_class.new.search_anagram(word) }
    context 'when assessing positive cases' do
      
      describe 'when the value of word is able' do
        let(:word) { "able" }
        it { is_expected.to eq('has anagrams ["abel", "bale", "beal"]') }
      end
      
      describe 'when the value of word is loop' do
        let(:word) { "loop" }
        it { is_expected.to eq('has anagrams ["polo", "pool"]') }
      end

    end
    context 'when assessing negative cases' do
      
      describe 'when the value of word is anagrama' do
        let(:word) { "anagrama" }
        it { is_expected.to eq('anagrama has no anagrams') }
      end

    end
  end
end


#i'll take a break
