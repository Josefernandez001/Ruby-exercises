require_relative '../product'

RSpec.describe Product do
  subject{ described_class.new(product).create }
  describe '#create' do
    context 'when assessing positive cases' do
      describe 'creation of a product' do
        let(:product){{'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}}
        it { is_expected().to eq({'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2})}
      end
      describe 'creation of another product' do
        let(:product){{'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100}}
        it { is_expected().to eq({'id' => 1,'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100})}
      end
    end

    context 'when assessing negative cases' do
      context 'when some required data is not passed' do
        describe 'when the name is not passed' do
          let(:product){{'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}}
          it {is_expected().to eq('name is required')}
        end

        describe 'when the value is not passed' do
          let(:product){{'name' => 'air_spring', 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}}
          it {is_expected().to eq('value is required')}
        end

        describe 'when the brand is not passed' do
          let(:product){{'name' => 'air_spring', 'value' => 5_000, 'description' => 'sunglasses', 'quantity' => 2}}
          it {is_expected().to eq('brand is required')}
        end
      end
    end
  end
# ------------
  describe '#count' do
    subject{ described_class.new('').count }
    context 'when assessing positive cases' do
      it {is_expected().to eq(2)}
    end
  end
# ------------
  describe '#all' do
    subject{ described_class.new('').all }
    context 'when assessing positive cases' do
      describe 'should return [{}...]' do
        it {is_expected.to eq([{'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2},{'id' => 1,'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100}])}
      end
    end
  end
# ------------
  describe '#find' do
    subject{ described_class.new('').find(id) }
    context 'when assessing positive cases' do
      describe 'when the value of id is 0' do
        let(:id){0}
        it {is_expected.to eq({'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2})}
      end

      describe 'when the value of id is 2' do
        let(:id){1}
        it {is_expected.to eq({'id' => 1,'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100})}
      end
    end

    context 'when assessing negative cases' do
      describe 'when the value of id is 10_000' do
        let(:id){10_000}
        it {is_expected.to eq('id not found')}
      end

      describe 'when the value of id is 20_000' do
        let(:id){20_0001}
        it {is_expected.to eq('id not found')}
      end
    end
  end
# ------------
  describe '#where' do
    subject{ described_class.new('').where(type,value) }
    context 'when assessing positive cases' do
      describe 'filtering by name ' do
        let(:type){'name'}
        let(:value){'after_party'}
        it{is_expected.to eq([{'id' => 1,'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100}])}
      end

      describe 'filtering by brand' do
        let(:type){'brand'}
        let(:value){'mumo'}
        it{is_expected.to eq([{'id' => 1,'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100}])}
      end

      describe 'filtering by description' do
        let(:type){'description'}
        let(:value){'sunglasses'}
        it{is_expected.to eq([{'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}])}
      end

      describe 'filtering by value>=' do
        let(:type){'value>='}
        let(:value){5_000}
        it{is_expected.to eq([{'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}, {'id' => 1,'name' => 'after_party', 'value' => 10_000, 'brand' => 'mumo', 'description' => 'helps to avoid hangover', 'quantity' => 100}])}
      end

      describe 'filtering by value<=' do
        let(:type){'value<='}
        let(:value){5_000}
        it{is_expected.to eq([{'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}])}
      end

      describe 'filtering by quantity' do
        let(:type){'quantity'}
        let(:value){2}
        it{is_expected.to eq([{'id' => 0,'name' => 'air_spring', 'value' => 5_000, 'brand' => 'kuky', 'description' => 'sunglasses', 'quantity' => 2}])}
      end
    end

    context 'when assessing negative cases' do
      describe 'filtering by name ' do
        let(:type){'name'}
        let(:value){'alab'}
        it{is_expected.to eq('not found')}
      end

      describe 'filtering by brand' do
        let(:type){'brand'}
        let(:value){'loop'}
        it{is_expected.to eq('not found')}
      end

      describe 'filtering by description' do
        let(:type){'description'}
        let(:value){'pool '}
        it{is_expected.to eq('not found')}
      end

      describe 'filtering by value>=' do
        let(:type){'value>='}
        let(:value){300000}
        it{is_expected.to eq('not found')}
      end

      describe 'filtering by value<=' do
        let(:type){'value<='}
        let(:value){1}
        it{is_expected.to eq('not found')}
      end

      describe 'filtering by quantity' do
        let(:type){'quantity'}
        let(:value){99}
        it{is_expected.to eq('not found')}
      end

      describe 'when the value of type is incorrect' do
        let(:type){'opfound'}
        let(:value){99}
        it{is_expected.to eq('not found')}
      end
    end
  end
# ------------
  describe '#update' do
    subject{ described_class.new('').update(id,object) }
    context 'when assessing positive cases' do
      describe 'upgrading a product' do
        let(:id){0}
        let(:object){{'id' => 0,'name' => 'air_spring_v2', 'value' => 9_000, 'brand' => 'kuky', 'description' => 'sunglasses_v2', 'quantity' => 3}}
        it{ is_expected.to eq({'id' => 0,'name' => 'air_spring_v2', 'value' => 9_000, 'brand' => 'kuky', 'description' => 'sunglasses_v2', 'quantity' => 3})}
      end
    end

    context 'when assessing negative cases' do
      context 'when some required data are not passed on' do
        describe 'when not passed name' do
          let(:id){0}
          let(:object){{'id' => 0, 'value' => 9_000, 'brand' => 'kuky', 'description' => 'sunglasses_v2', 'quantity' => 3}}
          it{ is_expected.to eq('name is required')}
        end
        describe 'when not passed brand' do
          let(:id){0}
          let(:object){{'id' => 0,'name' => 'air_spring_v2', 'value' => 9_000, 'description' => 'sunglasses_v2', 'quantity' => 3}}
          it{ is_expected.to eq('brand is required')}
        end
        describe 'when not passed value' do
          let(:id){0}
          let(:object){{'id' => 0,'name' => 'air_spring_v2', 'brand' => 'kuky', 'description' => 'sunglasses_v2', 'quantity' => 3}}
          it{ is_expected.to eq('value is required')}
        end

        describe 'when the id not found' do
          let(:id){219_219}
          let(:object){{'id' => 0,'name' => 'air_spring_v2', 'value' => 9_000, 'brand' => 'kuky', 'description' => 'sunglasses_v2', 'quantity' => 3}}
          it{ is_expected.to eq('id not found')}
        end
      end
    end
  end
# ------------
  describe '#delete' do
    subject{ described_class.new('').delete(id) }
    context 'when assessing positive cases' do
      describe 'when the value of id is 0' do
        let(:id){0}
        # here it returns this because the product with id 0 was modified earlier
        it{is_expected.to eq({"brand"=>"kuky", "description"=>"sunglasses_v2", "id"=>0, "name"=>"air_spring_v2", "quantity"=>3, "value"=>9000})}
      end
    end

    context 'when assessing negative cases' do
      describe 'when the value of id is 8992' do
        let(:id){8_992}
        it{is_expected.to eq('id not found')}
      end
    end
  end
end