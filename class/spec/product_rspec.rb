require_relative '../product'

RSpec.describe Product do
  subject{ described_class.new(product).create }

  describe '#create' do
    context 'when assessing positive cases' do
      describe 'creation of a product' do
         product = {
          name: 'azucar', value: 12.34, brand: 'manuelita', description: 'only sugar', quanty: 23
         }
         let(:product){ product }
         it { is_expected().to eq('new product create') }
      end
      describe 'creation of another product' do
         product = {
          name: 'book', value: 99.34, brand: 'DEBOLS!LLO', description: 'vida y epoca de michael k', quanty: 999
         }
         let(:product){ product }
         it { is_expected().to eq('new product create') }
      end
    end
    context "when assessing negative cases" do
      context 'when some required data is not passed' do
        describe 'when the name is not passed' do
          product = {
            value: 12.34, brand: 'manuelita', description: 'only sugar', quanty: 23
          }
         let(:product){ product }
         it {is_expected().to eq(['name is required'])}
        end

        describe 'when the value is not passed' do
          product = {
            name: 'azucar',brand: 'manuelita', description: 'only sugar', quanty: 23
          }
         let(:product){ product }
         it {is_expected().to eq(['value is required'])}
        end

        describe 'when the brand is not passed' do
          product = {
            name: 'azucar', value: 12.34,description: 'only sugar', quanty: 23
          }
         let(:product){ product }
         it {is_expected().to eq(['brand is required'])}
        end
      end
    end
  end
# ------------
  describe '#all' do
    subject {described_class.new({}).all}
    describe 'when two products have been created' do
      it { is_expected().to eq([{
        id: 0, name: 'azucar', value: 12.34, brand: 'manuelita', description: 'only sugar', quanty: 23
       }, {
        id: 1, name: 'book', value: 99.34, brand: 'DEBOLS!LLO', description: 'vida y epoca de michael k', quanty: 999
       }]) }
    end
  end
  # ------------
  describe '#count' do
    subject {described_class.new({}).counter}

    describe 'when two products have been created' do
      it { is_expected().to eq(2)}
    end

    describe 'when 3 products have been created' do
      subject {described_class.new({name: 'glass', value: 2.34, brand: 'sun', description: 'only a glass', quanty: 100})}
      it 'is expect to eq 3' do
        #in the create test we only create 2 products.
        # now let's create another product
        subject.create

        expect(subject.counter).to eq(3)
      end
    end
  end
  # ------------
  describe '#find' do
    subject {described_class.new({}).find(id)}
    context 'positive case' do
      describe 'when the value of id is 1' do
        let(:id){ 1 }
        it{ is_expected().to eq({
          id: 1, name: 'book', value: 99.34, brand: 'DEBOLS!LLO', description: 'vida y epoca de michael k', quanty: 999
         })}
      end
      describe 'when the value of id is 0' do
        let(:id){ 0 }
        it{ is_expected().to eq({
          id: 0, name: 'azucar', value: 12.34, brand: 'manuelita', description: 'only sugar', quanty: 23
         })}
      end
    end

    context 'negative case' do
      describe 'when the value of id is 99_999' do
        let(:id){ 99_999 }
        it{ is_expected().to eq('not found')}
      end
      describe 'when the value of id is 123' do
        let(:id){ 123 }
        it{ is_expected().to eq('not found')}
      end
    end

  end
  # ------------
  describe '#update' do
    subject {described_class.new({}).update(id, obj)}
    context 'when assessing positive cases' do
      describe 'updating a product with id 0' do
        product = {
          name: 'salt', value: 12.34, brand: 'refrisal', description: 'only salt', quanty: 100
        }
        let(:id){ 0 }
        let(:obj){ product }

        it{ is_expected().to eq('new product create')}
      end
    end

    context 'when assessing negative cases' do
      describe 'when not all the required data is passed' do
        product = {
          description: 'only salt', quanty: 100
        }
        let(:id){ 0 }
        let(:obj){ product }

        it{ is_expected().to eq(['name is required', 'value is required','brand is required'])}
      end
    end
  end
  # ------------
  describe '#where' do
    context 'when assessing positive cases' do
      context 'by value' do
        subject{described_class.new({}).where(condition, value)}
        describe 'when te value is greater than 12.99' do
          let(:condition){'value>='}
          let(:value){12.99}

          it{is_expected().to eq([{
            id: 1, name: 'book', value: 99.34, brand: 'DEBOLS!LLO', description: 'vida y epoca de michael k', quanty: 999
           }])}
        end

        describe 'when the value is less than than 12.99' do
          let(:condition){'value<='}
          let(:value){12.99}

          it{ is_expected().to eq([{:brand=>"sun", :description=>"only a glass",:id=>2,:name=>"glass",:quanty=>100,:value=>2.34},{:brand=>"refrisal", :description=>"only salt", :id=>0, :name=>"salt", :quanty=>100, :value=>12.34}])}
        end
      end

      context 'by data' do
        subject{described_class.new({}).where(condition, value)}
        describe 'name' do
          let(:condition){'name'}
          let(:value){'salt'}
          it {is_expected().to eq([{
            id: 0, name: 'salt', value: 12.34, brand: 'refrisal', description: 'only salt', quanty: 100
          }])}
        end

        describe 'brand' do
          let(:condition){'brand'}
          let(:value){'DEBOLS!LLO'}
          it {is_expected().to eq([{
            id: 1, name: 'book', value: 99.34, brand: 'DEBOLS!LLO', description: 'vida y epoca de michael k', quanty: 999
           }])}
        end

        describe 'quanty' do
          let(:condition){'quanty'}
          let(:value){999}
          it {is_expected().to eq([{:brand=>"DEBOLS!LLO", :description=>"vida y epoca de michael k", :id=>1, :name=>"book", :quanty=>999, :value=>99.34}])}
        end

        describe 'description' do
          let(:condition){'description'}
          let(:value){'only a glass'}
          it {is_expected().to eq([{:brand=>"sun", :description=>"only a glass", :id=>2, :name=>"glass", :quanty=>100, :value=>2.34}])}
        end
      end
    end

    context 'when assessing negative cases' do
      subject{described_class.new({}).where(condition, value)}
      context 'when there is no greater or lesser value' do
        describe 'when there is no lower value' do
          let(:condition){'value<='}
          let(:value){0}
          it {is_expected().to eq('not found')}
        end

        describe 'when there is no higher value' do
          let(:condition){'value>='}
          let(:value){283_283}
          it {is_expected().to eq('not found')}
        end
      end

      context 'when there is no record with the value searched for' do
        subject{described_class.new({}).where(condition, value)}

        describe 'for name' do
          let(:condition){'name'}
          let(:value){'magazine'}
          it {is_expected().to eq('not found')}
        end

        describe 'for brand' do
          let(:condition){'brand'}
          let(:value){'juan valdez'}
          it {is_expected().to eq('not found')}
        end

        describe 'for quanty' do
          let(:condition){'quanty'}
          let(:value){9_992}
          it {is_expected().to eq('not found')}
        end

        describe 'for description' do
          let(:condition){'description'}
          let(:value){'not found'}
          it {is_expected().to eq('not found')}
        end
      end
    end
  end
  # ------------
  describe '#delete' do
    subject{ described_class.new({}).remove(id) }
    describe 'removing id 0' do
      let(:id){0}
      it {is_expected().to eq({:brand=>"refrisal", :description=>"only salt", :id=>0, :name=>"salt", :quanty=>100, :value=>12.34})}
    end

    describe 'when the id does not exist' do
      let(:id){11_111}
      it {is_expected().to eq('not found')}
    end
  end

end