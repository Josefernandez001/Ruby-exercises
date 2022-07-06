require_relative '../analyzing_shakespeare'

RSpec.describe AnalyzingShakespeare do
  subject { described_class.new.analyzing }
  describe '#analyzing' do
    context 'when assessing positive cases' do
      characters = AnalyzingShakespeare.new
      it { is_expected.to eq(characters.analyzing) }
    end
  end
end
