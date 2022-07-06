require_relative '../analyzing_shakespeare'

RSpec.describe AnalyzingShakespeare do
  subject { described_class.new.analyzing }
  describe '#analyzing' do
    context 'when assessing positive cases' do
      characters = { 'First Witch' => 23, 'Second Witch' => 15, 'Third Witch' => 13, 'DUNCAN' => 18, 'MALCOLM' => 40, 'Sergeant' => 3, 'LENNOX' => 22, 'ROSS' => 39, 'MACBETH' => 146, 'BANQUO' => 33, 'ANGUS' => 4, 'LADY MACBETH' => 59, 'Messenger' => 6, 'FLEANCE' => 2, 'Porter' => 4, 'MACDUFF' => 59, 'DONALBAIN' => 3, 'Old Man' => 4, 'ATTENDANT' => 1, 'First Murderer' => 19, 'Second Murderer' => 6, 'Both Murderers' => 2, 'Servant' => 5, 'Third Murderer' => 6, 'Lords' => 3, 'HECATE' => 2, 'Lord' => 3, 'First Apparition' => 1, 'Second Apparition' => 2, 'Third Apparition' => 1, 'LADY MACDUFF' => 19, 'Son' => 14, 'Doctor' => 20, 'Gentlewoman' => 11, 'MENTEITH' => 5, 'CAITHNESS' => 3, 'SEYTON' => 5, 'SIWARD' => 11, 'Soldiers' => 1, 'YOUNG SIWARD' => 4 }
      it { is_expected.to eq(characters) }
    end
  end
end
