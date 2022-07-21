require_relative '../user'

RSpec.describe User do
  subject { described_class.new(user) }

  describe '#create' do
    context 'when assessing positive cases' do
      describe 'when a user with all the data is passed to it' do
        user = {
          name: 'jose', last_name: 'fernandez', email: 'josefernandezllanos@gmail.com',
          age: 18, address: 'cll15#22760'
        }
        let(:user) { user }

        it 'expect new user create' do
          expect(subject.create).to eq('new user create')
        end
      end

      describe 'when a other user with all the data is passed to it' do
        user = {
          name: 'ismael', last_name: 'fernandez', email: 'isma@gmail.com',
          age: 11, address: 'cll15#22760'
        }
        let(:user) { user }

        it 'expect new user create' do
          expect(subject.create).to eq('new user create')
        end
      end
    end

    context 'when assessing negative cases' do
      context 'passing on repeated data' do

        describe 'when a repeated email is passed ' do
          user = {
            name: 'jose', last_name: 'fernandez', email: 'josefernandezllanos@gmail.com',
            age: 18, address: 'cll15#22760'
          }
          let(:user) { user }

          it 'expect the email is repeated' do
            expect(subject.create).to eq(['email is repeat'])
          end
        end
      end

      context 'when some data is not passed on' do

        describe 'when we do not pass the name ' do
          user = {
            last_name: 'fernandez', email: 'pol@gmail.com',
            age: 18, address: 'cll15#22760'
          }
          let(:user) { user }

          it 'expect name is required' do
            expect(subject.create).to eq(['name is required'])
          end
        end

        describe 'when we do not pass the last_name ' do
          user = {
            name: 'jose', email: 'koi@gmail.com',
            age: 18, address: 'cll15#22760'
          }
          let(:user) { user }

          it 'expect last name is required' do
            expect(subject.create).to eq(['last name is required'])
          end
        end

        describe 'when we do not pass the email ' do
          user = {
            name: 'jose', last_name: 'fernandez',
            age: 18, address: 'cll15#22760'
          }
          let(:user) { user }

          it 'expect email is required' do
            expect(subject.create).to eq(['email is required'])
          end
        end
        describe 'when we do not pass all data require ' do
          user = {
            age: 18, address: 'cll15#22760'
          }
          let(:user) { user }

          it 'expect email is required' do
            expect(subject.create).to eq(['name is required', 'last name is required', 'email is required'])
          end
        end
      end
    end
  end

  describe '#count' do
    user = {
      name: 'sky', last_name: 'lambda', email: 'sky_full_star@gmail.com',
      age: 18, address: 'cll15#22760'
    }
    let(:user) { user }
    context 'when assessing positive cases' do
      describe 'when we had already created two users' do
        it 'is expect to eq 2' do
          expect(subject.counter).to eq(2)
        end
      end
      describe 'when we had already created 3 users' do
        it 'is expect to eq 3' do
          # in the create test we only create 2 users.
          # now let's create another user
          subject.create
          # puts subject.all.to_s

          expect(subject.counter).to eq(3)
        end
      end
    end
  end

  describe '#all' do
    describe 'calling the method all ' do
      let(:user){{}}
      it 'is expected to {...}' do
        expect(subject.all).to eq([
          {:address=>"cll15#22760", :age=>18, :email=>"josefernandezllanos@gmail.com", :id=>0, :last_name=>"fernandez", :name=>"jose"},
          {:address=>"cll15#22760", :age=>11, :email=>"isma@gmail.com", :id=>1, :last_name=>"fernandez", :name=>"ismael"},
          {:address=>"cll15#22760", :age=>18, :email=>"sky_full_star@gmail.com", :id=>2, :last_name=>"lambda", :name=>"sky"}
        ])
      end
    end
  end

  describe '#find' do
    subject { described_class.new({}).find(id) }
    context 'when assessing positive cases' do
      describe 'when the value of id is 1' do
        let(:id){0}
        it { is_expected.to eq({:id => 0, :address=>"cll15#22760", :age=>18, :email=>"josefernandezllanos@gmail.com", :last_name=>"fernandez", :name=>"jose"})}
      end

      describe 'when the value of id is 1' do
        let(:id){1}
        it { is_expected.to eq({:id => 1, :address=>"cll15#22760", :age=>11, :email=>"isma@gmail.com", :last_name=>"fernandez", :name=>"ismael"})}
      end
    end

    context 'when assessing negative cases' do
      let(:id){99_999}
      it { is_expected.to eq('not found')}
    end
  end

  describe '#where' do
    subject { described_class.new({}).where(type,data) }
    context 'when assessing positive cases' do
      describe 'filtering by name' do
        let(:type){'name'}
        let(:data){'jose'}
        it { is_expected.to eq([{:address=>"cll15#22760", :age=>18, :email=>"josefernandezllanos@gmail.com", :id=>0, :last_name=>"fernandez", :name=>"jose"}]) }
      end

      describe 'filtering by last name' do
        let(:type){'last_name'}
        let(:data){'fernandez'}
        it { is_expected.to eq([{
          id: 0, name: 'jose', last_name: 'fernandez', email: 'josefernandezllanos@gmail.com',
          age: 18, address: 'cll15#22760'
        }, {
          id: 1, name: 'ismael', last_name: 'fernandez', email: 'isma@gmail.com',
          age: 11, address: 'cll15#22760'
        }]) }
      end
      #filtrando por edad mayor igual
      describe 'filtering by age >=' do
        let(:type){'age>='}
        let(:data){18}
        it { is_expected.to eq([{:address=>"cll15#22760",:age=>18,:email=>"josefernandezllanos@gmail.com",:id=>0,:last_name=>"fernandez",:name=>"jose"},{:address=>"cll15#22760",:age=>18,:email=>"sky_full_star@gmail.com",:id=>2,:last_name=>"lambda",:name=>"sky"}])}
      end

      #filtrando por edad menor igual
      describe 'filtering by age <=' do
        let(:type){'age<='}
        let(:data){17}
        it { is_expected.to eq([{:address=>"cll15#22760", :age=>11, :email=>"isma@gmail.com", :id=>1, :last_name=>"fernandez", :name=>"ismael"}]) }
      end

      describe 'filtering by address' do
        let(:type){'address'}
        let(:data){'cll15#22760'}
        it { is_expected.to eq([{
          id: 0, name: 'jose', last_name: 'fernandez', email: 'josefernandezllanos@gmail.com',
          age: 18, address: 'cll15#22760'
        }, {
          id: 1, name: 'ismael', last_name: 'fernandez', email: 'isma@gmail.com',
          age: 11, address: 'cll15#22760'
        },{
          id:2, name: 'sky', last_name: 'lambda', email: 'sky_full_star@gmail.com',
          age: 18, address: 'cll15#22760'
        }]) }
      end
    end

    context 'negative cases' do
      describe 'filtering by name' do
        let(:type){'name'}
        let(:data){'noexiste'}
        it { is_expected.to eq('not found') }
      end

      describe 'filtering by last name' do
        let(:type){'last_name'}
        let(:data){'paero'}
        it { is_expected.to eq('not found') }
      end

      describe 'filtering by age >=' do
        let(:type){'age>='}
        let(:data){22}
        it { is_expected.to eq('not found') }
      end

      describe 'filtering by age <=' do
        let(:type){'age<='}
        let(:data){9}
        it { is_expected.to eq('not found') }
      end
    end
  end

  describe '#update' do
    subject { described_class.new({}).update(id,object) }
    context 'when assessing positive cases' do
      describe 'change all data' do
        user = {
          name: 'paco', last_name: 'llanos', email: 'pacollaon@gmail.com',
          age: 12, address: 'cll15#227610'
        }
        let(:object){user}
        let(:id){0}
        it{is_expected.to eq(user)}
      end
    end
    context 'when assessing negative cases' do
      context 'changing some data but without some required fields' do
        describe 'without first name' do
          user = {
            last_name: 'fernandez', email: 'asde@gmail.com',
            age: 18, address: 'cll15#22760'
          }
          let(:object){user}
          let(:id){0}
          it{is_expected.to eq(['name is required'])}
        end

        describe 'without last name' do
          user = {
            name: 'jose', email: 'asd@gmail.com',
            age: 18, address: 'cll15#22760'
          }
          let(:object){user}
          let(:id){0}
          it{is_expected.to eq(['last name is required'])}
        end

        describe 'without email' do
          user = {
            name: 'jose', last_name: 'fernandez',
            age: 18, address: 'cll15#22760'
          }
          let(:object){user}
          let(:id){0}
          it{is_expected.to eq(['email is required'])}
        end
      end

      context 'when single data are repeated' do
        describe 'when the email is repeated' do
          user = {
            name: 'jose', last_name: 'fernandez', email: 'isma@gmail.com',
            age: 18, address: 'cll15#22760'
          }
          let(:object){user}
          let(:id){0}
          it { is_expected.to eq(['email is repeat'])}
        end
      end

      describe 'when the id does not exist' do
        let(:object){{}}
        let(:id){3_172_417}
        it { is_expected.to eq('not found')}
      end
    end
  end

  describe '#delete' do
    subject { described_class.new({}).delete(id) }
    context 'when assessing positive cases' do
      describe 'when the value of id is 1' do
        let(:id){0}
        it {is_expected.to eq({:address=>"cll15#227610", :age=>12, :email=>"pacollaon@gmail.com", :id=>0, :last_name=>"llanos", :name=>"paco"})}
      end
    end

    context 'when assessing negative cases' do
      describe 'when the id value does not exist' do
        let(:id){238923}
        it{is_expected.to eq('not found')}
      end
    end
  end
end